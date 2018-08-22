function Start-AsAdmin {
    # .EXTERNALHELP PWAddins-help.xml
    [CmdletBinding(SupportsShouldProcess)]
    param (
            [Parameter(
                Mandatory,
                HelpMessage='Powershell commands to be started as admin'
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
        Verb = 'RunAs'
        FilePath = 'powershell.exe'
        WindowStyle = $WindowStyle
        ArgumentList = "-ExecutionPolicy RemoteSigned -encodedcommand $encodedCommand"
    }
    if ($PSCmdlet.ShouldProcess('start as admin', $Command)) {
        Start-Process @ProcessParams -Wait
    }
}
