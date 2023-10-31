function Test-IsAdmin {
    # .EXTERNALHELP PWAddins-help.xml
    [Alias('Test-IsAdministrator')]
    [OutputType([Boolean])]
    [CmdletBinding()]
    param ()

    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    ([Security.Principal.WindowsPrincipal] $currentUser).IsInRole(
        [Security.Principal.WindowsBuiltinRole]::Administrator
    )
}
