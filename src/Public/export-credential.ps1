function Export-Credential {
    # .EXTERNALHELP PWAddins-help.xml
    param (
            [parameter(
                Mandatory,
                ValueFromPipeline,
                ValueFromPipelineByPropertyName
            )]
            [pscredential]
        $Credential,
            [parameter(
                Mandatory,
                ValueFromPipelineByPropertyName,
                HelpMessage = 'How do you name the exported credential?'
            )]
            [string]
            [Alias('FileName')]
        $Name,
            [string]
        $Path = (Join-Path -Path $env:LOCALAPPDATA -ChildPath 'Powershell')
    )

    process {
        if (-not (Test-Path -Path $Path)) {
            $null = New-Item -Path $Path -ItemType Directory -Force
        }

        $FilePath = Join-Path -Path $Path -ChildPath ('{0}.xml' -f $Name)

        if (Test-Path -LiteralPath $FilePath) {
            Remove-Item -LiteralPath $FilePath
        }

        $CallerErrorActionPreference = $ErrorActionPreference
        try {
            $Credential | Export-Clixml -Path $FilePath
        }
        catch {
            Write-Error -ErrorRecord $_ -ErrorAction $CallerErrorActionPreference
        }
        Write-Verbose -Message ('Credential for {0} has been saved' -f $name)
    }
}
