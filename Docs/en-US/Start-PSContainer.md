---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version:
schema: 2.0.0
---

# Start-PSContainer

## SYNOPSIS

Starts container from PowerShell image

## SYNTAX

```
Start-PSContainer [-ImageName] <String> [<CommonParameters>]
```

## DESCRIPTION

This function starts container from Powershell image.

## EXAMPLES

### Example 1

```powershell
Start-PSContainer -ImageName my/image
```

This example starts PowerShell container from specified image

## PARAMETERS

### -ImageName

Specifies image name for container

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### None

## NOTES

## RELATED LINKS
