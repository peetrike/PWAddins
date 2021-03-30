function Get-HostName {
    # .EXTERNALHELP PWAddins-help.xml
    [CmdletBinding()]
    [OutputType([String])]

    Param (
            [switch]
            # Output FQDN
        $Fqdn
    )

    $HostName = [net.dns]::GetHostName()
    if ($Fqdn) {
        ([Net.Dns]::GetHostEntry($HostName)).HostName
    } else { $HostName }
}
