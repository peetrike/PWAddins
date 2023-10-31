function Start-PSv2 {
    # .EXTERNALHELP PWAddins-help.xml
    #[Alias('Invoke-PsV2')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSUseShouldProcessForStateChangingFunctions',
        '',
        Scope = 'Function',
        Target = 'Start-PSv2'
    )]
    [CmdletBinding()]
    param (
            [Parameter(
                ValueFromRemainingArguments
            )]
            [string[]]
        $ArgumentList,
            [Diagnostics.ProcessWindowStyle]
        $WindowStyle = [Diagnostics.ProcessWindowStyle]::Normal
    )

    if ($PSVersionTable.PSVersion.Major -eq 2) {
        Write-Warning -Message 'PowerShell v2 engine is already running'
    } else {
        $Provider = $MyInvocation.MyCommand.ModuleName

        $null = Get-WinEvent -ListProvider $Provider -ErrorAction Stop

        Write-Verbose -Message ('Starting PS v2 with arguments: {0}' -f ($ArgumentList -join ' '))
        $LogMessage = @(
            'User {0} starts PowerShell 2 engine with parameters:' -f $env:USERNAME
            $ArgumentList
        ) -join [Environment]::NewLine
        [Diagnostics.EventLog]::WriteEntry(
            $Provider,
            $LogMessage,
            [Diagnostics.EventLogEntryType]::Information,
            1       # Event ID
        )

        $ProcessParams = @{
            FilePath     = 'powershell.exe'
            WindowStyle  = $WindowStyle
            ArgumentList = @(
                '-Version 2'
                $ArgumentList
            )
        }
        Start-Process @ProcessParams
    }
}
