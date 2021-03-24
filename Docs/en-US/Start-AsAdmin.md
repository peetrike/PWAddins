---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version: https://github.com/peetrike/PWAddins/blob/master/Docs/Start-AsAdmin.md
schema: 2.0.0
---

# Start-AsAdmin

## SYNOPSIS

Starts given PowerShell commands in elevated Powershell

## SYNTAX

```
Start-AsAdmin [-Command] <String> [[-WindowStyle] <ProcessWindowStyle>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION

Runs given Powershell commands in elevated environment.

## EXAMPLES

### EXAMPLE 1

```powershell
Start-AsAdmin -Command "Update-Help"
```

This command starts string "Update-Help" in separate process with administrative rights.

## PARAMETERS

### -Command

Powershell commands that require elevated environment

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
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

### -WhatIf

Shows what would happen if the cmdlet runs. The cmdlet is not run.

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

### -WindowStyle

Makes elevated Powershell window visible or hidden

```yaml
Type: ProcessWindowStyle
Parameter Sets: (All)
Aliases:
Accepted values: Normal, Hidden, Minimized, Maximized

Required: False
Position: 1
Default value: Hidden
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Start-Process](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/start-process)

[Test-IsAdmin](Test-IsAdmin.md)
