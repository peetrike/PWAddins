function Export-Credential {
    <#
        .SYNOPSIS
        Stores credential objects in .xml file

        .DESCRIPTION
        This function saves given credential to .xml file in predefined path.
        The path is by default in Local Application Data folder.

        You must also determine the name of saved credential

        .PARAMETER Credential
        Specifies the Credential that will be saved.  Type a user name, such as User01
        or Domain01\User01, or enter a PSCredential object, such as one from the Get-Credential cmdlet.

        .PARAMETER Name
        Specify a name for stored credential.

        .PARAMETER Path
        Specify a path where the credential will be stored.  By default it is a subfolder in Local Application Data folder

        .INPUTS
        [PSCredential]
        Takes credential object from pipe.

        .EXAMPLE
        Get-Credential | Export-Credential -Name 'me@server'

        .EXAMPLE
        Export-Credential -Credential $MyCredential -Name 'me@server'

        .EXAMPLE
        [PSCustomObject] @{ Name = 'me@server' ; Credential = $MyCredential } | Export-Credential

        .LINK
        Get-Credential
        Export-CliXml
        Securely Store Credentials on Disk http://www.powershellcookbook.com/recipe/PukO/securely-store-credentials-on-disk
    #>

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
