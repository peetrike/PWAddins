﻿# Module manifest for module 'PWAddins'
# Generated by: Peter Wawa
# Generated on: 04.07.2018

@{
    RootModule        = 'PWAddins.psm1'
    ModuleVersion     = '1.8.2'

    GUID              = 'e2da415a-130b-4376-88d6-0d9b6cf8c807'
    Author            = 'Peter Wawa'
    #CompanyName = 'Unknown'
    Copyright         = '(c) 2023 Peter Wawa. All rights reserved.'
    Description       = 'Various helper functions for everyday use'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '3.0'
    # CompatiblePSEditions = @('Desktop','Core')

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module.
    # This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module.
    # This prerequisite is valid for the PowerShell Desktop edition only.
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules   = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry,
    # use an empty array if there are no functions to export.
    FunctionsToExport = @(
        'Export-Credential'
        'Get-Accelerator'
        'Get-EnumValue'
        'Get-HostName'
        'Get-OsVersion'
        'Get-TypeUrl'
        'Import-Credential'
        'Invoke-WithCulture'
        'Remove-Alias'
        'Start-AsAdmin'
        'Start-PSv2'
        'Test-IsAdmin'
    )

    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @(
        'Invoke-AsAdmin'
        'Test-IsAdministrator'
        'Using-Culture'
    )

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess.
    # This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{
        PSData = @{
            ExternalModuleDependencies = @()

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags                       = @(
                'PSEdition_Core'
                'PSEdition_Desktop'
                'Windows'
            )

            LicenseUri                 = 'https://github.com/peetrike/PWAddins/blob/master/LICENSE'
            ProjectUri                 = 'https://github.com/peetrike/PWAddins'
            # IconUri = ''

            ReleaseNotes               = 'https://github.com/peetrike/PWAddins/blob/master/CHANGELOG.md'
        }
    }

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module.
    # Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''
}
