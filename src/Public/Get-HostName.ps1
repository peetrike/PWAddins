function Get-HostName {
    # .EXTERNALHELP PWAddins-help.xml
    [OutputType([string])]
    [CmdletBinding()]
    param (
            [switch]
        $Fqdn
    )

    if ($Fqdn) {
        ([Net.Dns]::GetHostEntry('')).HostName
    } else {
        [Net.Dns]::GetHostName()
    }
}
