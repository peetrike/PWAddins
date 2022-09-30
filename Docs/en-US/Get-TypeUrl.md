---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version: https://github.com/peetrike/PWAddins/blob/master/Docs/Get-TypeUrl.md
schema: 2.0.0
---

# Get-TypeUrl

## SYNOPSIS

Constructs documentation URL for .NET class

## SYNTAX

```
Get-TypeUrl [[-Type] <Type>] [-Invoke] [<CommonParameters>]
```

## DESCRIPTION

This function generates documentation URL for provided .NET type

## EXAMPLES

### Example 1

```powershell
Get-TypeUrl -Type 'String'
```

This example generates documentation link for `String` type.

### Example 2

```powershell
(Get-Process)[0].GetType() | Get-TypeUrl -Invoke
```

This example generates documentation link for the `Get-Process` returned object
type.

## PARAMETERS

### -Invoke

Open the generated Url in browser

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type

Specifies the type to use

```yaml
Type: Type
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Type

The type to use for generating documentation link

## OUTPUTS

### System.Object

The generated Url

## NOTES

## RELATED LINKS

[Get-EnumValue](Get-EnumValue.md)
