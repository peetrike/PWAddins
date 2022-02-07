function Get-Accelerator {
    # .EXTERNALHELP PWAddins-help.xml
    [CmdletBinding()]
    param (
            [SupportsWildcards()]
            [string]
        $Name = '*'
    )

    $TAType = [psobject].Assembly.GetType('System.Management.Automation.TypeAccelerators')
    $AcceleratorList = $TAType::Get
    $AcceleratorList.Keys | Where-Object { $_ -like $Name } | ForEach-Object {
        $PropList = [ordered] @{
            Name = $_
            Type = if ($_ -like 'psobject') { [psobject] } else { $AcceleratorList.$_ }
        }
        New-Object -TypeName PSObject -Property $PropList
    }
}
