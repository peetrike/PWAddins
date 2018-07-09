# Requires -RunAsAdministrator
#Requires -Module PowerShellGet

function Update-LocalModule {
    <#
        .SYNOPSIS
        Updates local modules from Powershell repository

        .DESCRIPTION
        Get all local modules and check against new version in any Powershell repository
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
            Select-Object -Property Name,Version |
            Select-Object -Unique

        foreach ($module in $modules) {
            if (Get-InstalledModule -Name $module.Name -ErrorAction SilentlyContinue) {
                Write-Verbose -Message ('Updating installed module {0}' -f $module.Name)
                Update-Module -Name $module.Name
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
                    $CallerErrorActionPreference = $ErrorActionPreference
                    try {
                        Write-Verbose -Message (
                            'Installing newer version of module {0} from repository {1}' -f $module.Name, $ProposedModule.Repository
                        )
                        Install-Module @ParamSet -ErrorAction Stop
                    }
                    catch {
                        Write-Error -ErrorRecord $_ -ErrorAction $CallerErrorActionPreference
                    }
                } else {
                    Write-Verbose -Message ("module already up to date: {0}" -f $module.Name )
                }
            }
        }

    }
}
