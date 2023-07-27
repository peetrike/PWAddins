function Get-EnumValue {
    [CmdletBinding()]
    param (
            [Parameter(
                ValueFromPipeline
            )]
            [ValidateScript({
                if ($_.BaseType -eq [enum]) {
                    $true
                } else {
                    throw 'Provided Type is not Enum'
                }
            })]
            [type]
        $Type
    )

    process {
        [enum]::GetValues($Type) |
        Select-Object @{
            Name       = 'Name'
            Expression = { $_ }
        }, @{
            Name       = 'Value'
            Expression = { $_.value__ }
        }
    }
}
