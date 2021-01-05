function Start-AsAdmin {
    # .EXTERNALHELP PWAddins-help.xml
    [CmdletBinding(SupportsShouldProcess)]
    [Alias('Invoke-AsAdmin')]
    param (
            [Parameter(
                Mandatory,
                HelpMessage = 'Powershell commands to be started as admin'
            )]
            [ValidateNotNullorEmpty()]
            [String]
        $Command
            , [ValidateSet('Normal', 'Hidden')]
            [string]
        $WindowStyle = 'Hidden'
    )

    $commandBytes = [Text.Encoding]::Unicode.GetBytes($Command)
    $encodedCommand = [Convert]::ToBase64String($commandBytes)

    $ProcessParams = @{
        Verb         = 'RunAs'
        FilePath     = (Get-Process -Id $PID).Path
        WindowStyle  = $WindowStyle
        ArgumentList = "-ExecutionPolicy RemoteSigned -EncodedCommand $encodedCommand"
    }
    if ($PSCmdlet.ShouldProcess($Command, 'start as admin')) {
        Start-Process @ProcessParams -Wait
    }
}
