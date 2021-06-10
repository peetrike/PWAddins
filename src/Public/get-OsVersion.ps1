# Requires -Version 3
# Requires -Modules CimCmdlets
function Get-OsVersion {
    # .EXTERNALHELP PWAddins-help.xml
    [CmdletBinding()]
    [OutputType([Version])]
    Param()

    [Environment]::OSVersion.Version
#    [Version] (Get-CimInstance -ClassName Win32_OperatingSystem -Property Version).Version
}
