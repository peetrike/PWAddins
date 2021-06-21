#Requires -Version 3.0

[CmdletBinding(
    DefaultParameterSetName = 'Task'
)]
param (
        [parameter(
            ParameterSetName = 'Task',
            Position = 0
        )]
        [string[]]
        # Build task(s) to execute
    $Task = 'default',
        [parameter(
            ParameterSetName = 'Task'
        )]
        [switch]
        # Bootstrap dependencies
    $Bootstrap,
        [parameter(
            Mandatory,
            ParameterSetName = 'Help'
        )]
        [switch]
        # List available build tasks
    $Help
)

$ErrorActionPreference = 'Stop'

# Bootstrap dependencies
if ($Bootstrap.IsPresent) {
    $null = Get-PackageProvider -Name Nuget -ForceBootstrap
    # Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
    if (-not (Get-Module -Name PSDepend -ListAvailable)) {
        Install-Module -Name PSDepend -Repository PSGallery -Force
    }
    Import-Module -Name PSDepend -Verbose:$false
    Invoke-PSDepend -Path './requirements.psd1' -Install -Import -Force -WarningAction SilentlyContinue
}

# Execute psake task(s)
$psakeFile = Join-Path -Path $PSScriptRoot -ChildPath 'psakeFile.ps1'
if ($Help.IsPresent) {
    Get-PSakeScriptTasks -buildFile $psakeFile |
        Where-Object Description |
        Select-Object -Property Name, Description, Alias
    exit
} else {
    Invoke-psake -buildFile $psakeFile -taskList $Task -nologo
    exit ( [int]( -not $psake.build_success ) )
}
