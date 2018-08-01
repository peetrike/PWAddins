#Requires -Modules BuildHelpers, Pester

$projectRoot = Split-Path -Path $PSScriptRoot -Parent
$buildEnvironment = Get-BuildEnvironment -Path $projectRoot -BuildOutput "$projectRoot\Release"
$moduleName = $buildEnvironment.ProjectName
$manifestPath = ("{0}\{1}\{1}.psd1" -f $buildEnvironment.BuildOutput, $moduleName)

# Remove all versions of the module from the session. Pester can't handle multiple versions.
Get-Module $moduleName | Remove-Module -Force

Import-Module -Name $manifestPath -Force -Verbose:$false -ErrorAction Stop

$RequiredVersion = (Get-Module $ModuleName).Version

if ($ExportedAliases = (Get-Module $ModuleName).ExportedAliases.Values.Name)
{

	foreach ($ExportedAlias in $ExportedAliases)
	{
		Describe "Testing exported alias $ExportedAlias" {

			$script:AliasInSession = $null

			It "Get-Alias should not error out" {
				{ $script:AliasInSession = Get-Alias $ExportedAlias -ErrorAction Stop } | Should Not Throw
			}

			It "Get-Alias should find alias in session" {

				$script:AliasInSession.Name | Should Be $ExportedAlias
			}

			It "Get-Alias should find value" {

				$script:AliasInSession.ResolvedCommandName -or $script:AliasInSession.Definition | Should Be $True
			}
		}
	}
}
else
{
	Write-Host "Module.TestAliases.Tests.ps1:  $ModuleName ($RequiredVersion) does not export any aliases."
}
