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
    Update-TypeData -PrependPath $PSScriptRoot\PWAddins.types.ps1xml
    Update-FormatData -PrependPath $PSScriptRoot\PWAddins.format.ps1xml
}
