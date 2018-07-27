function Import-Credential {
    [OutputType('PSCredential')]
    param (
            [parameter(
                Mandatory
            )]
            [Alias('FileName')]
            [String]
        $Name,
        $Path = (Join-Path -Path $env:LOCALAPPDATA -ChildPath 'Powershell')
    )

    $FilePath = Join-Path -Path $Path -ChildPath ('{0}.xml' -f $Name)

    $CallerErrorActionPreference = $ErrorActionPreference
    try {
        Import-Clixml $FilePath -ErrorAction Stop
    }
    catch {
        Write-Error -ErrorRecord $_ -ErrorAction $CallerErrorActionPreference
    }
}
