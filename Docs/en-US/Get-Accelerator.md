---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version: https://github.com/peetrike/PWAddins/tree/master/Docs/en-US/Get-Accelerator.md
schema: 2.0.0
---

# Get-Accelerator

## SYNOPSIS

Get list of defined type accelerators

## SYNTAX

```
Get-Accelerator [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION

This function returns a list of defined type accelerators.

## EXAMPLES

### Example 1

```powershell
Get-Accelerator -Name ps*
```

This example lists type accelerators that start with string 'ps'

## PARAMETERS

### -Name

Specifies the accelerator name to get.  Wildcard characters are permitted.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Collections.Generic.Dictionary

A list of accelerators

## NOTES

## RELATED LINKS
