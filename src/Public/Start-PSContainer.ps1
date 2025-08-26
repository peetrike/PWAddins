function Start-PSContainer {
    # .EXTERNALHELP PWAddins-help.xml
    [OutputType([void])]
    [Alias('Start-LinuxPS')]
    [CmdletBinding()]
    param (
            [Parameter(
                Mandatory
            )]
            [string]
        $ImageName
    )

    function Get-PodmanMachine {
        podman machine list --format json | ConvertFrom-Json
    }

    $Machine = Get-PodmanMachine
    while ($Machine.Starting) {
        Write-Verbose -Message 'Podman machine is still starting'
        Start-Sleep -Seconds 5
        $Machine = Get-PodmanMachine
    }

    if (-not $Machine.Running) {
        podman machine start
    }

    podman run --rm -it "localhost/$ImageName"
}
