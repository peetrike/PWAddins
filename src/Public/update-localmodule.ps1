# Requires -RunAsAdministrator
# Requires -Modules PowerShellGet

function Update-LocalModule {
    # .EXTERNALHELP PWAddins-help.xml
    [CmdletBinding(SupportsShouldProcess)]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSReviewUnusedParameter',
        'Repository'
    )]
    Param (
            [parameter(
                ValueFromPipeline,
                ValueFromPipelineByPropertyName
            )]
            [ValidateNotNullOrEmpty()]
            [SupportsWildcards()]
            [string[]]
        $Name = '*',
            [ValidateNotNullOrEmpty()]
            [string[]]
        $Repository
    )

    Begin {
        if (-not (Test-IsAdmin)) {
            throw 'Admin permission required'
        }
        Import-Module PowerShellGet -Verbose:$false
        $CallerErrorActionPreference = $ErrorActionPreference
    }

    Process {
        Get-Module -Name $Name -ListAvailable -Verbose:$false |
            Group-Object -Property Name |
            ForEach-Object {
                $module = $_
                $InstalledProps = @{
                    Name        = $module.Name
                    ErrorAction = [Management.Automation.ActionPreference]::SilentlyContinue
                }
                if ($Repository) {
                    $InstalledProps.Repository = $Repository
                }
                if ($InstalledModule = Get-InstalledModule @InstalledProps) {
                    if ($PSCmdlet.ShouldProcess($module.Name, 'Update module')) {
                        $UpdateProps = @{
                            Name    = $module.Name
                            WhatIf  = $false
                            Confirm = $false
                        }
                        if ($InstalledModule.AdditionalMetadata.IsPrerelease) {
                            $UpdateProps.AllowPreRelease = $true
                        }
                        $InstalledModule | Update-Module @UpdateProps
                    }
                } else {
                    $FindProps = @{
                        Name = $module.Name
                    }
                    if ($Repository) {
                        $FindProps.Repository = $Repository
                    }
                    $ProposedModule = Find-Module @FindProps -ErrorAction SilentlyContinue |
                        Sort-Object -Property Version -Descending |
                        Select-Object -First 1
                    if ($ProposedModule) {
                        $Newest = $module.Group | Sort-Object -Property Version -Descending | Select-Object -First 1
                        if (-not ($Edition = $PSEdition)) { $Edition = 'Desktop' }
                            # find-module returns version as string
                        if ([version]$ProposedModule.Version -gt $Newest.Version -and
                            $ProposedModule.Tags -match ('Windows|{0}' -f $Edition)
                        ) {
                            if ($PSCmdlet.ShouldProcess($module.Name, 'Install newer version of module')) {
                                $InstallSet = @{
                                    WhatIf  = $false
                                    Confirm = $false
                                    Force   = $true
                                    Scope   = 'AllUsers'
                                }
                                try {
                                    $ProposedModule | Install-Module @InstallSet -ErrorAction Stop
                                } catch {
                                    Write-Error -ErrorRecord $_ -ErrorAction $CallerErrorActionPreference
                                }
                            }
                        } else {
                            Write-Verbose -Message ('Module already up to date: {0}' -f $module.Name )
                        }
                    } else {
                        Write-Verbose -Message ('Module not found: {0}' -f $module.Name)
                    }
                }
            }
    }
}
