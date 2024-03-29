function Start-AsAdmin {
    # .EXTERNALHELP PWAddins-help.xml
    [Alias('Invoke-AsAdmin')]
    [CmdletBinding(SupportsShouldProcess)]
    param (
            [Parameter(
                Mandatory,
                HelpMessage = 'Powershell commands to be started as admin'
            )]
            [ValidateNotNullOrEmpty()]
            [String]
        $Command,
            [Diagnostics.ProcessWindowStyle]
        $WindowStyle = [Diagnostics.ProcessWindowStyle]::Hidden
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
