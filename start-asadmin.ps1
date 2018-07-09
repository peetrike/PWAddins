#Requires -version 2.0

function Start-AsAdmin {
    <#
        .Synopsis
        Starts given PowerShell commands in elevated Powershell

        .Description
        Runs given Powershell commands in elevated environment.

        .Parameter Command
        Powershell commands that require elevated environment

        .Parameter WindowStyle
        Makes elevated Powershell window visible or hidden

        .Example
        PS c:\> Start-AsAdmin -Command "Update-Help"
    #>

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
    Start-Process @ProcessParams -Wait
}
