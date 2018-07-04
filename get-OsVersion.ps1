# Requires -Version 3
# Requires -Modules CimCmdlets
function Get-OsVersion {
    [CmdletBinding()]
    [OutputType([Version])]
    Param()

    [System.Environment]::OSVersion.Version
#    New-Object -TypeName System.Version -ArgumentList (Get-CimInstance -ClassName Win32_OperatingSystem).Version
}