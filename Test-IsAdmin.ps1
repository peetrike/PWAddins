Function Test-IsAdmin {
<#
    .Synopsis
    Tells whether the current user is an administrator.

    .Description
    The Test-IsAdmin function determines whether the current user is a member of the
    Administrators group on the local computer.
    It returns TRUE if a user is an administrator and FALSE otherwise.
    This function has no parameters.

    .Example
    C:\PS> Test-IsAdmin
    False

    .Example
    # This prompt uses the Test-IsAdministrator function to change the prompt when the user
    # is an administrator.

    function prompt {
       if (Test-IsAdmin) { '[ADMIN]: ' }
       else {
         $(if (test-path variable:/PSDebugContext) { '[DBG]: ' }
           else { '' }) + 'PS ' + $(Get-Location) + $(if ($nestedpromptlevel -ge 1) { '>>' }) + '> '
    }
#>

    [CmdletBinding()]
    [OutputType([Boolean])]
    param()

    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    ([Security.Principal.WindowsPrincipal] $currentUser).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

New-Alias -Name Test-IsAdministrator -Value Test-IsAdmin
