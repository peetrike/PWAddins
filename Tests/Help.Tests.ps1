#Requires -Modules BuildHelpers, Pester

[Diagnostics.CodeAnalysis.SuppressMessage('PSUseDeclaredVarsMoreThanAssigments', '', Scope='*', Target='SuppressImportModule')]
$SuppressImportModule = $false
. $PSScriptRoot\Shared.ps1

# Taken with love from @juneb_get_help (https://github.com/juneb/PesterTDD/blob/master/Module.Help.Tests.ps1)

Describe "Help for module $moduleName" {
    ## When testing help, remember that help is cached at the beginning of each session.
    ## To test, restart session.

    foreach ($command in Get-Command -Module $moduleName -CommandType Cmdlet, Function) { # Workflow not supported on PS7
        $commandName = $command.Name

        Describe "Command $commandName" -Tags @('MetaTest', $commandName) {
            # The module-qualified command fails on Microsoft.PowerShell.Archive cmdlets
            $help = Get-Help -Name $commandName -ErrorAction SilentlyContinue

            It 'should not be auto-generated' -TestCases @{
                commandName = $commandName
                help = $help
            } {
                # If help is not found, synopsis in auto-generated help is the syntax diagram
                $help.Synopsis.TrimStart() |
                    Should -Not -BeLike "$commandName *" -Because 'command should have synopsis'
            }

            It 'has description' -TestCases @{ help = $help } {
                $help.Description |
                    Should -Not -BeNullOrEmpty -Because 'Command should have a description'
            }

            Context "Examples" {
                $Examples = foreach ($example in $help.Examples.example) {
                    @{
                        code    = $example.code
                        remarks = $example.remarks
                        title   = $example.title
                    }
                }
                It "has at least one example" -TestCases @{ Examples = $Examples } {
                    $Examples.code |
                        Should -Not -BeNullOrEmpty -Because 'Every command should have an example'
                }

                if ($Examples) {
                    It 'Example has code: <title>' -TestCases $Examples {
                        $code | Should -Not -BeNullOrEmpty
                    }
                    It 'Example has description: <title>' -TestCases $Examples {
                        $remarks<# .text #> |
                            Should -Not -BeNullOrEmpty -Because 'every example should be described'
                    }
                }
            }

            Context "Parameters" {
                $common = 'Debug', 'ErrorAction', 'ErrorVariable', 'InformationAction', 'InformationVariable',
                'OutBuffer', 'OutVariable', 'PipelineVariable', 'Verbose', 'WarningAction', 'WarningVariable',
                'Confirm', 'Whatif'

                # Without the filter, WhatIf and Confirm parameters are still flagged in "finds help parameter in code" test
                $helpParameters = $help.parameters.parameter |
                    Where-Object Name -NotIn $common |
                    Sort-Object -Property Name -Unique
                $parameters = $command.ParameterSets.Parameters |
                    Where-Object Name -NotIn $common |
                    Sort-Object -Property Name -Unique

                It "all parameters have help topic" -TestCases @{
                    helpParameters = $helpParameters
                    parameters     = $parameters
                } {
                    @($helpParameters).Count |
                        Should -Be @($parameters).Count -Because 'The number of parameters in the help should match the number in the command'
                }

                foreach ($parameter in $parameters) {
                    $parameterName = $parameter.Name
                    Context "Parameter $parameterName" {
                        #BeforeEach {
                            $codeMandatory = $parameter.IsMandatory.toString()
                            $parameterHelp = $helpParameters | Where-Object Name -EQ $parameterName
                            $codeType = $parameter.ParameterType.Name
                            $helpType = if ($parameterHelp.parameterValue) { $parameterHelp.parameterValue.Trim() }
                        #}

                        It "has help description" -TestCases @{
                            parameterHelp = $parameterHelp
                        } {
                            $parameterHelp.Description.Text |
                                Should -Not -BeNullOrEmpty -Because 'Every parameter should have a description'
                        }

                        # Required value in Help should match IsMandatory property of parameter
                        It "has correct Mandatory value" -TestCases @{
                            parameterHelp = $parameterHelp
                            codeMandatory = $codeMandatory
                        } {
                            $parameterHelp.Required | Should -Be $codeMandatory
                        }

                        # Parameter type in Help should match code
                        It "has correct parameter type" -TestCases @{
                            helpType = $helpType
                            codeType = $codeType
                        } {
                                # To avoid calling Trim method on a null object.
                            $helpType | Should -Be $codeType
                        }
                    }
                }
            }

            Context "Help Links for $commandName" {
                $links = $help.relatedLinks.navigationLink |
                    Where-Object uri |
                    ForEach-Object {
                        @{
                            linkText = $_.linkText
                            uri      = $_.uri
                        }
                    }
                if ($links) {
                    It 'Link is available online - <linkText>' -TestCases $links {
                        $Result = Invoke-WebRequest -Uri $uri -UseBasicParsing
                        $Result.StatusCode |
                            Should -Be '200' -Because 'URL should respond'
                    }
                }
            }
        }
    }
}
