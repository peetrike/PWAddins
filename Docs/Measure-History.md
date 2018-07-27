---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version:
schema: 2.0.0
---

# Measure-History

## SYNOPSIS
Measures the execution time of command from history

## SYNTAX

```
Measure-History [[-Id] <Int64>] [<CommonParameters>]
```

## DESCRIPTION
This command takes an item form history and calculates the execution time

## EXAMPLES

### EXAMPLE 1
```
Measure-History -Id 3
```

### EXAMPLE 2
```
Get-History -ID 3 | Measure-History
```

## PARAMETERS

### -Id
Specifies the ID number of a command in the history.

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $MyInvocation.HistoryId - 1
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Timespan
This command returns a measured history item execution time.

## NOTES

## RELATED LINKS

[Get-History]()

