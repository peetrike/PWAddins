# Requires -RunAsAdministrator
#Requires -Module PowerShellGet

function Update-LocalModule {
    <#
        .DESCRIPTION
        Get all local modules and check against new version in any Powershell Repository
    #>

    [CmdletBinding(SupportsShouldProcess)]
    Param (
            # Module name(s) to be checked
            [parameter(
                ValueFromPipeline,
                ValueFromPipelineByPropertyName
            )]
            [ValidateNotNullOrEmpty()]
            [string[]]
        $Name = "*",
            # Repository to search modules from
            [ValidateNotNullOrEmpty()]
            [string[]]
        $Repository

    )

    Begin {
        if (-not (Test-IsAdmin)) {
            throw "Admin presmission required"
        }
    }

    Process {
        $modules = Get-Module -Name $Name -ListAvailable |
            Select-Object -Property Name,Version

        foreach ($module in $modules) {
            $installedModule = Get-InstalledModule -Name $module.Name -ErrorAction SilentlyContinue
            if ($installedModule ) {
                $installedModule | Update-Module
            } else {
                $ParamSet = @{
                    Name = $module.Name
                }
                if ($Repository) {
                    $ParamSet.Repository = $Repository
                }
                $ProposedModule = Find-Module @ParamSet -ErrorAction SilentlyContinue
                if (-not $ProposedModule) {
                    Write-Verbose -Message ("module not found: {0}" -f $module.Name)
                    # continue
                } elseif ([version]$ProposedModule.Version -gt $module.Version) {  # find-module returns version as string
                    try {
                        update-module @ParamSet -ErrorAction Stop
                    }
                    catch {
                        Install-Module @ParamSet -Force
                    }
                } else {
                    Write-Verbose -Message ("module already up to date: {0}" -f $module.Name )
                }
            }
        }

    }
}
