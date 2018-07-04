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

. $psScriptRoot\measure-history.ps1
. $psScriptRoot\remove-alias.ps1
. $psScriptRoot\start-asadmin.ps1
. $psScriptRoot\Test-IsAdmin.ps1

#Export-ModuleMember -Function * -Alias * -Variable *
