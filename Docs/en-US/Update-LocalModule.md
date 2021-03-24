---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version: https://github.com/peetrike/PWAddins/blob/master/Docs/Update-LocalModule.md
schema: 2.0.0
---

# Update-LocalModule

## SYNOPSIS

Updates local modules from Powershell repository

## SYNTAX

```
Update-LocalModule [[-Name] <String[]>] [[-Repository] <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

Get local modules and check against new version in any Powershell repository.
If newer version is available, a newer version is installed.  If module is
already installed from repository, it will be updated.

## EXAMPLES

### Example 1

```powershell
Update-LocalModule -Name MyModule*
```

Looks for modules with name pattern MyModule* and tries to find newer version
from registered repositories.

### Example 2

```powershell
Get-Module myModule* -ListAvailable | Update-LocalModule
```

Looks for modules with name pattern MyModule* and tries to find newer version
from registered repositories.

## PARAMETERS

### -Confirm

Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name

Module name(s) to be checked.  Wildcards are allowed.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: *
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: True
```

### -Repository

Repositories to search modules from.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf

Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Management.Automation.PSModuleInfo, String or None

This command can take moduleinfo objects from pipeline to process.

## OUTPUTS

## NOTES

Trying to check all locally installed modules might take a lot of time.

Admin permissions are required as if module requires reinstall, it will be
installed to AllUsers scope.

## RELATED LINKS

[Install-Module](https://docs.microsoft.com/powershell/module/powershellget/install-module)

[Update-Module](https://docs.microsoft.com/powershell/module/powershellget/update-module)
