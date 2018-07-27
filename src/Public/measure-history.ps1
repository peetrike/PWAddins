function Measure-History {
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

            $historyToMeasure.EndExecutionTime.Subtract($historyToMeasure.StartExecutionTime)
            # New-TimeSpan -Start $historyToMeasure.StartExecutionTime -End $historyToMeasure.EndExecutionTime
        } catch {
            Write-Error -ErrorRecord $_ -ErrorAction $CallerErrorActionPreference
        }
    }
}

New-Alias -Name howlong -Value Measure-History
