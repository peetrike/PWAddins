---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version: https://github.com/peetrike/PWAddins/blob/master/Docs/Get-HostName.md
schema: 2.0.0
---

# Get-HostName

## SYNOPSIS

Returns computer name or FQDN

## SYNTAX

```
Get-HostName [-Fqdn] [<CommonParameters>]
```

## DESCRIPTION

This function returns current computer name or FQDN (if _Fqdn_ parameter is
used).

## EXAMPLES

### Example 1

```powershell
Get-HostName -Fqdn
```

This example returns computer FQDN

## PARAMETERS

### -Fqdn

Specifies that FQDN should be returned

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.String

Computer name or FQDN

## NOTES

## RELATED LINKS
