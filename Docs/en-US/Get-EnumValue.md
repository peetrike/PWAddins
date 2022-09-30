---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version: https://github.com/peetrike/PWAddins/blob/master/Docs/Get-EnumValue.md
schema: 2.0.0
---

# Get-EnumValue

## SYNOPSIS

Show all enum values with both name and number

## SYNTAX

```
Get-EnumValue [[-Type] <Type>] [<CommonParameters>]
```

## DESCRIPTION

This function returns all enum values in name and number form

## EXAMPLES

### Example 1

```powershell
Get-EnumValue -Type 'Management.Automation.Actionpreference'
```

This example returns all ActionPreference enum values

### Example 2

```powershell
$VerbosePreference.GetType() | Get-EnumValue
```

This example returns all enum values of `VerbosePreference` variable

## PARAMETERS

### -Type

Specifies enum type

```yaml
Type: Type
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Type

Enum type to process

## OUTPUTS

### System.Object

All possible valuse of provided enum

## NOTES

## RELATED LINKS

[Enum.GetValues Method](https://learn.microsoft.com/dotnet/api/system.enum.getvalues)

[Get-TypeUrl](Get-TypeUrl.md)
