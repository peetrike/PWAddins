if ($PSVersionTable.PSVersion.Major -lt 6) {
    $FileNamePart = Join-Path -Path $PSScriptRoot -ChildPath 'HistoryInfo'
    if (-not (Get-TypeData -TypeName Microsoft.PowerShell.Commands.HistoryInfo).Members.Duration) {
        Update-TypeData -PrependPath ($FileNamePart + '.types.ps1xml')
    }
    if (
        (
            Get-FormatData -TypeName Microsoft.PowerShell.Commands.HistoryInfo
        ).FormatViewDefinition.Name -notcontains 'History.Table'
    ) {
        Update-FormatData -PrependPath ($FileNamePart + '.format.ps1xml')
    }
}
