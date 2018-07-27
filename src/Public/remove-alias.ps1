function Remove-Alias {
    <#
        .SYNOPSIS
        Remove an alias from the shell

        .DESCRIPTION
        The command removes alias from the current session.

        .PARAMETER Name
        Specifies the alias to be removed.  Wildcards are permitted.

        .EXAMPLE
        Remove-Alias -Name myalias

        .EXAMPLE
        Get-Alias test* | Remove-Alias

        .LINK
        Get-Alias
        New-Alias
        Set-Alias
    #>

    [CmdLetBinding(SupportsShouldProcess)]
    Param (
            [parameter(
                Mandatory,
                ValueFromPipelineByPropertyName
            )]
            [ValidateNotNullOrEmpty()]
            [ValidateScript({
                if (Get-Alias $_) {$true}
                else {
                    throw "Alias not found: $_"
                }
            })]
            [String]
        $Name
    )

    Process {
        Remove-Item -Path Alias:$Name
    }
}
