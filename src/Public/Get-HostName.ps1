
#Requires -Version 2.0

function Get-HostName {
    # .EXTERNALHELP PWAddins-help.xml
    [CmdletBinding()]
    [OutputType([String])]

    Param (
            [switch]
            # Output FQDN
        $Fqdn
    )

    $HostName = hostname.exe
    if ($Fqdn) {
        ([Net.Dns]::GetHostEntry($HostName)).HostName
    } else { $HostName }
}
