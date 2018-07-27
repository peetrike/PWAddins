<#
    .Synopsis
    Module that contains additional useful functions for command line

    .Description
    Some tweaks for command-line environment.

    .NOTES
    Author: Peter Wawa

#>
Set-StrictMode -Version Latest

Write-Verbose "Initializing module PWAddins"

$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )

#Dot source the files
Foreach($import in @($Public + $Private)) {
    Try {
        . $import.fullname
    }
    Catch {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}
