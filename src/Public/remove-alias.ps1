function Remove-Alias {
    # .EXTERNALHELP PWAddins-help.xml
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
            [SupportsWildcards()]
            [String]
        $Name
    )

    Process {
        Remove-Item -Path Alias:$Name
    }
}
