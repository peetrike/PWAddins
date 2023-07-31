function Get-OsVersion {
    # .EXTERNALHELP PWAddins-help.xml
    [OutputType([version])]
    [CmdletBinding()]
    param ()

    [Environment]::OSVersion.Version
}
