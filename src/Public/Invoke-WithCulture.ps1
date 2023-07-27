function Invoke-WithCulture {
    [Alias('Using-Culture')]
    [CmdletBinding()]
    param (
            [Parameter(Mandatory)]
            [cultureinfo]
        $Culture,
            [Parameter(Mandatory)]
            [scriptblock]
        $ScriptBlock
    )

    $OldCulture = [Threading.Thread]::CurrentThread.CurrentCulture
    $OldUICulture = [Threading.Thread]::CurrentThread.CurrentUICulture
    try {
        [Threading.Thread]::CurrentThread.CurrentCulture = $Culture
        [Threading.Thread]::CurrentThread.CurrentUICulture = $Culture
        Invoke-Command -ScriptBlock $ScriptBlock
    } finally {
        [Threading.Thread]::CurrentThread.CurrentCulture = $OldCulture
        [Threading.Thread]::CurrentThread.CurrentUICulture = $OldUICulture
    }
}
