function measure-history {
    (get-history ($MyInvocation.HistoryId -1)).endexecutiontime.subtract((get-history ($MyInvocation.HistoryId -1)).startexecutiontime).totalseconds
}