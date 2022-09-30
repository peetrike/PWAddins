function Get-HostName {
    # .EXTERNALHELP PWAddins-help.xml
    [CmdletBinding()]
    [OutputType([String])]

    Param (
            [switch]
            # Output FQDN
        $Fqdn
    )

    if ($Fqdn) {
        ([Net.Dns]::GetHostEntry('')).HostName
    } else {
        [Net.Dns]::GetHostName()
    }
}
