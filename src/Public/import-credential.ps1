function Import-Credential {
    <#
        .SYNOPSIS
        Imports previously saved credential

        .DESCRIPTION
        This function imports credential object from a file.

        .PARAMETER Name
        Specifies the name of saved credential

        .PARAMETER Path
        Specifies the path where credentials are stored.  By default this is subfolder under Local Application Data

        .EXAMPLE
        $MyCredential = Import-Credential -Name 'Me@server'

        .INPUTS
        None

        .OUTPUTS
        None or [PSCredential]

        .LINK
        export-credential
        get-credential
    #>

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
