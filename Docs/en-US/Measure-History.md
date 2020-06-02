---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version: https://github.com/peetrike/PWAddins/blob/master/Docs/Measure-History.md
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
This command takes an item form history and calculates the execution time.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Measure-History -Id 3
```

This command measures runtime of history item in psoition 3

### EXAMPLE 2
```
PS C:\> Get-History -ID 3 | Measure-History
```

This command measures runtime of history item in psoition 3

## PARAMETERS

### -Id
Specifies the ID number of a command in the history.

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: $MyInvocation.HistoryId - 1
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### Microsoft.PowerShell.Commands.HistoryInfo or None
This command can take history objects from pipeline.

## OUTPUTS

### System.Timespan
This command returns a measured history item execution time.

## NOTES

## RELATED LINKS

[Get-History](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-history)
