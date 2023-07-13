---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version: https://github.com/peetrike/PWAddins/tree/master/Docs/en-US/Invoke-WithCulture.md
schema: 2.0.0
---

# Invoke-WithCulture

## SYNOPSIS

Invoke ScriptBlock within specified culture scope.

## SYNTAX

```
Invoke-WithCulture [-Culture] <CultureInfo> [-ScriptBlock] <ScriptBlock> [<CommonParameters>]
```

## DESCRIPTION

This function runs given scriptblock using specified culture context.

## EXAMPLES

### Example 1
```powershell
Invoke-WithCulture -Culture 'de-de' -ScriptBlock { Get-Date}
```

Run `Get-Date` cmdlet using German culture info.

## PARAMETERS

### -Culture

Specify culture to be used.

```yaml
Type: CultureInfo
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScriptBlock

Specify scriptblock to be invoked.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

The invoked scriptblock results.

## NOTES

## RELATED LINKS
