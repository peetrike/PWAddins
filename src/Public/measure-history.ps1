function Measure-History {
    <#
        .SYNOPSIS
        Measures the execution time of command from history

        .DESCRIPTION
        This command takes an item form history and calculates the execution time

        .PARAMETER Id
        Specifies the ID number of a command in the history.

        .EXAMPLE
        Measure-History -Id 3

        .EXAMPLE
        Get-History -ID 3 | Measure-History

        .OUTPUTS
        System.Timespan
        This command returns a measured history item execution time.

        .LINK
        Get-History
    #>

    [CmdLetBinding() ]
    [OutputType([TimeSpan])]
    param (
            [Parameter(
                ValueFromPipelineByPropertyName
            )]
            [ValidateNotNullOrEmpty()]
            [Int64]
        $Id = $MyInvocation.HistoryId - 1
    )

    Process {
        $CallerErrorActionPreference = $ErrorActionPreference
        try {
            $historyToMeasure = Get-History -Id $Id -ErrorAction Stop

            #$historyToMeasure.endexecutiontime.subtract($historyToMeasure.startexecutiontime).totalseconds
            New-TimeSpan -Start $historyToMeasure.StartExecutionTime -End $historyToMeasure.EndExecutionTime
        } catch {
            Write-Error -ErrorRecord $_ -ErrorAction $CallerErrorActionPreference
        }
    }
}

New-Alias -Name howlong -Value Measure-History
