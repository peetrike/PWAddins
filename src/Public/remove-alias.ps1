function Remove-Alias {
    # .EXTERNALHELP PWAddins-help.xml
    [CmdLetBinding(SupportsShouldProcess)]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSAvoidOverwritingBuiltInCmdlets',
        '',
        Scope = 'Function',
        Target = 'Remove-Alias'
    )]
    param (
            [Parameter(
                Mandatory,
                Position = 0,
                ValueFromPipeline,
                ValueFromPipelineByPropertyName
            )]
            [ValidateNotNullOrEmpty()]
            [ValidateScript( {
                if (Get-Alias $_) { $true }
                else {
                    throw "Alias not found: $_"
                }
            })]
            [SupportsWildcards()]
            [string[]]
        $Name,
            [switch]
        $Force,
            [string]
        $Scope
    )

    process {
        if ($PSVersionTable.PSVersion.Major -lt 6) {
            Remove-Item -Path Alias:$Name -Force:$Force.IsPresent
        } else {
            Microsoft.PowerShell.Utility\Remove-Alias @PSBoundParameters
        }
    }
}
