---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version:
schema: 2.0.0
---

# Start-AsAdmin

## SYNOPSIS
Starts given PowerShell commands in elevated Powershell

## SYNTAX

```
Start-AsAdmin [-Command] <String> [[-WindowStyle] <String>] [<CommonParameters>]
```

## DESCRIPTION
Runs given Powershell commands in elevated environment.

## EXAMPLES

### EXAMPLE 1
```
Start-AsAdmin -Command "Update-Help"
```

## PARAMETERS

### -Command
Powershell commands that require elevated environment

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowStyle
Makes elevated Powershell window visible or hidden

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Hidden
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
