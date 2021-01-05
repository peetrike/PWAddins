<#
    .Synopsis
    Module that contains additional useful functions for command line

    .Description
    Some tweaks for command-line environment.

    .NOTES
    Author: Peter Wawa

#>
# Set-StrictMode -Version Latest

Write-Verbose "Initializing module PWAddins"

$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )

#Dot source the files
foreach ($import in @($Public + $Private)) {
    try {
        . $import.FullName
    } catch {
        Write-Error -Message ("Failed to import function {0}: {1}" -f $import.FullName, $_)
    }
}

foreach ($Function in $Public) {
    Export-ModuleMember -Function $Function.BaseName
}

if ($PSVersionTable.PSVersion.Major -lt 6) {
    $FileNamePart = join-path -Path $PSScriptRoot -ChildPath 'HistoryInfo'
    if (-not (Get-TypeData -TypeName Microsoft.PowerShell.Commands.HistoryInfo).Members.Duration) {
        Update-TypeData -PrependPath ($FileNamePart + '.types.ps1xml')
    }
    if (
        (
            Get-FormatData -TypeName Microsoft.PowerShell.Commands.HistoryInfo
        ).FormatViewDefinition.Name -notcontains 'History.Table'
    ) {
        Update-FormatData -PrependPath ($FileNamePart + '.format.ps1xml')
    }
}
