Function Test-IsAdmin {
    # .EXTERNALHELP PWAddins-help.xml
    [CmdletBinding()]
    [OutputType([Boolean])]
    [Alias('Test-IsAdministrator')]
    param()

    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    ([Security.Principal.WindowsPrincipal] $currentUser).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
