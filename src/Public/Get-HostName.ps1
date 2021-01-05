
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

    if ($Fqdn) {
        ([Net.Dns]::GetHostByName($env:COMPUTERNAME)).HostName
    } else { $env:COMPUTERNAME }
}
