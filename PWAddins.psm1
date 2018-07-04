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

. $psScriptRoot\remove-alias.ps1
. $psScriptRoot\import-assembly.ps1
. $psScriptRoot\get-tcpsession.ps1
. $psScriptRoot\measure-history.ps1

new-alias howlong measure-history

Export-ModuleMember -Function * -Alias * -Variable *