function Write-LogEvent {
    # .EXTERNALHELP PWAddins-help.xml
    [CmdletBinding()]
    param (
            [Parameter(Mandatory)]
            [ValidateScript({
                [Diagnostics.EventLog]::SourceExists($_)
            })]
            [string]
        $Source,
            [Diagnostics.EventLogEntryType]
        $EntryType = [Diagnostics.EventLogEntryType]::Information,
            [Alias('Id')]
            [int]
        $EventId = 1,
            [Parameter(Mandatory)]
            [string]
        $MessageTemplate,
            [ValidateCount(0, 256)]
            [string[]]
        $Data
    )

    $Message = $MessageTemplate -f $Data

    $EventInstance = New-Object System.Diagnostics.EventInstance -ArgumentList (
        $EventID,
        0,          # CategoryId
        $EntryType
    )
    [Diagnostics.EventLog]::WriteEvent(
        $Source,
        $EventInstance,
        @(
            $Message
            $Data
        )
    )
}
