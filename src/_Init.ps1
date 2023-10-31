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

if (Get-Command Register-ArgumentCompleter -ErrorAction SilentlyContinue) {
    $CompleterSB = {
        param (
                [string]
            $commandName,
                [string]
            $parameterName,
                [string]
            $wordToComplete,
                [Management.Automation.Language.CommandAst]
            $commandAst,
                [Collections.IDictionary]
            $fakeBoundParameters
        )

        $word = [regex]::Escape($wordToComplete)
        $cultureList = [cultureinfo]::GetCultures([Globalization.CultureTypes]::SpecificCultures) |
            Where-Object { $_.Name -match $word -or $_.DisplayName -match $word }

        foreach ($culture in $cultureList) {
                [Management.Automation.CompletionResult]::new(
                    $culture.Name,                                                      # completionText
                    [string]::Format('{0}, {1}', $culture.Name, $culture.DisplayName),  # listItemText
                    [Management.Automation.CompletionResultType]::ParameterValue,       # resultType
                    $culture.DisplayName                                                # toolTip
                )
            }
    }
    Register-ArgumentCompleter -CommandName Invoke-WithCulture -ParameterName Culture -ScriptBlock $CompleterSB
}
