function Export-Credential {
    # .EXTERNALHELP PWAddins-help.xml
    param (
            [Parameter(
                Mandatory,
                ValueFromPipeline,
                ValueFromPipelineByPropertyName
            )]
            [pscredential]
            [Management.Automation.Credential()]
        $Credential,
            [Parameter(
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

    begin {
        if (-not (Test-Path -Path $Path -PathType Container)) {
            $null = New-Item -Path $Path -ItemType Directory -Force
        }
    }

    process {
        $FilePath = Join-Path -Path $Path -ChildPath ('{0}.xml' -f $Name)

        if (Test-Path -LiteralPath $FilePath) {
            Remove-Item -LiteralPath $FilePath
        }

        $CallerErrorActionPreference = $ErrorActionPreference
        try {
            $Credential | Export-Clixml -Path $FilePath -ErrorAction Stop
        } catch {
            Write-Error -ErrorRecord $_ -ErrorAction $CallerErrorActionPreference
        }
        Write-Verbose -Message ('Credential for {0} has been saved' -f $name)
    }
}
