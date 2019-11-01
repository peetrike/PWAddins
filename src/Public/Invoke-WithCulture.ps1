function Invoke-WithCulture {
    param(
            [Parameter(Mandatory=$true)]
            [System.Globalization.CultureInfo]
        $Culture,
            [Parameter(Mandatory=$true)]
            [ScriptBlock]
        $ScriptBlock
    )

    $OldCulture = [System.Threading.Thread]::CurrentThread.CurrentCulture
    $OldUICulture = [System.Threading.Thread]::CurrentThread.CurrentUICulture
    try {
        [System.Threading.Thread]::CurrentThread.CurrentCulture = $culture
        [System.Threading.Thread]::CurrentThread.CurrentUICulture = $culture
        Invoke-Command $ScriptBlock
    }
    finally {
        [System.Threading.Thread]::CurrentThread.CurrentCulture = $OldCulture
        [System.Threading.Thread]::CurrentThread.CurrentUICulture = $OldUICulture
    }
}

New-Alias -Name Using-Culture -Value Invoke-WithCulture
