function Start-PSv2 {
    # .EXTERNALHELP PWAddins-help.xml
    [CmdletBinding(
        SupportsShouldProcess
    )]
    #[Alias('Invoke-PsV2')]
    param (
            [string[]]
        $ArgumentList,
            [Diagnostics.ProcessWindowStyle]
        $WindowStyle = 'Normal'
    )

    if ($PSVersionTable.PSVersion.Major -eq 2) {
        Write-Warning -Message 'PowerShell v2 engine is already running'
    } else {
        $Provider = $MyInvocation.MyCommand.ModuleName

        $null = Get-WinEvent -ListProvider $Provider -ErrorAction Stop
        <# if (-not [Diagnostics.EventLog]::SourceExists($Provider)) {
            $errorParams = @{
                Message      = 'The provider "{0}" does not exist' -f $Provider
                Category     = 'ObjectNotFound'
                TargetObject = $Provider
                RecommendedAction = 'Create provider (as admin)'
            }
            Write-Error @errorParams -ErrorAction Stop
        } #>

        $LogMessage = @(
            'Starting PowerShell 2 engine with parameters:'
            $ArgumentList
        ) -join [Environment]::NewLine
        [Diagnostics.EventLog]::WriteEntry(
            $Provider,
            $LogMessage,
            [Diagnostics.EventLogEntryType]::Information,
            1
        )

        $ProcessParams = @{
            FilePath     = 'powershell'
            WindowStyle  = $WindowStyle
            ArgumentList = @(
                '-Version 2'
                $ArgumentList
            )
        }
        Start-Process @ProcessParams
    }
}
