function Get-TcpSession {
    <#
    	.SYNOPSIS
        Returns current TCP/UDP sessions based on filter
        
        .DESCRIPTION
        
        
        .PARAMETER Filter
        Specifies string filter to find TCP sessions
        
        .PARAMETER All
        Displays all connections and listening ports.
        
        .Outputs
        String[] sessions
        
        .Example
        get-TcpSession ":80 "
        
        .Link
        netstat

        .NOTES
        Author: Peter Wawa

    #>

    param (
            [Switch]
        $All,
            [parameter(Mandatory=$true)]
            [String]
            [ValidateNotNullOrEmpty()]
        $Filter
    )
    "`n  Proto  Local Address          Foreign Address        State           PID"
    
    if($All) {
        netstat -ano | select-string $filter
    } else {
        netstat -no | select-string $filter
    }
}