function Get-OsVersion {
    # .EXTERNALHELP PWAddins-help.xml
    [OutputType([version])]
    [OutputType([string])]
    [OutputType('PWAddins.OSVersion')]
    [CmdletBinding()]
    param (
            [ValidateSet('Object', 'String', 'Version')]
            [string]
        $Type = 'Version'
    )

    function New-PSObject {
        [CmdletBinding()]
        param (
                [string]
            $TypeName,
                [Parameter(
                    Mandatory = $true,
                    Position = 0
                )]
                [Collections.IDictionary]
            $Property
        )

        if ($PSVersionTable.PSVersion.Major -gt 2) {
            if ($TypeName) { $Property.PSTypeName = $TypeName }
            [pscustomobject] $Property
        } else {
            $object = New-Object -TypeName PSObject -Property $Property
            if ($TypeName) { $object.psobject.TypeNames.Insert(0, $TypeName) }
            $object
        }
    }

    $RegPath = 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion'
    $RegKey = Get-ItemProperty -Path $RegPath
    $Revision = $RegKey.UBR
    $OsVersion = [environment]::OSVersion.Version
    $VersionObject = New-Object -TypeName Version -ArgumentList @(
            $OsVersion.Major
            $OsVersion.Minor
            $RegKey.CurrentBuildNumber
            $Revision
    )

    switch ($Type) {
        'Version' {
            $VersionObject
        }
        'Object' {
            New-PSObject -TypeName 'PWAddins.OSVersion' -Property @{
                Version    = $VersionObject
                Edition    = $RegKey.EditionID
                Type       = $RegKey.InstallationType
                CSDVersion = $RegKey.CSDVersion
            }
        }
        'String' {
            $Build = @(
                $RegKey.CurrentBuildNumber
                if ($Revision) { $Revision }
            ) -join '.'
            $DisplayVersion = $RegKey.DisplayVersion
            if (-not $DisplayVersion) {
                $ReleaseId = $RegKey.ReleaseId
                $DisplayVersion = if ($ReleaseId) {
                    $ReleaseId
                } else {
                    $RegKey.CurrentVersion
                }
            }
            '{0} Version {1} (Build {2})' -f $RegKey.ProductName, $DisplayVersion, $Build
        }
    }
}
