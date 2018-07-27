---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version:
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
Get all local modules and check against new version in any Powershell repository

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Name
Module name(s) to be checked

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Repository
Repository to search modules from

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
