---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version:
schema: 2.0.0
---

# Write-LogEvent

## SYNOPSIS

Writes event log entry

## SYNTAX

```
Write-LogEvent [-Source] <String> [[-EntryType] <EventLogEntryType>] [[-EventId] <Int32>]
 [-MessageTemplate] <String> [[-Data] <String[]>] [<CommonParameters>]
```

## DESCRIPTION

This function writes Event log entry using specified provider/source.

MessageTemplate is combined with Data objects using PowerShell `-f` operator.

## EXAMPLES

### Example 1

```powershell
Write-LogEvent -Source mySource -EventId 3 -Message 'An event message'
```

This example writes specified message to event log with custom EventId

### Example 2

```powershell
Write-LogEvent -Source mySource -MessageTemplate 'Important numbers: {0}, {1}' -Data 42, 31
```

This example uses message template to combine message and data into Event Log
entry message.

## PARAMETERS

### -Data

Collection of objects to store into event properties.
When MessageTemplate contains placeholders, objects are also inserted to message.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EntryType

Specifies Event Log entry type.

```yaml
Type: EventLogEntryType
Parameter Sets: (All)
Aliases:
Accepted values: Error, Warning, Information, SuccessAudit, FailureAudit

Required: False
Position: 1
Default value: Information
Accept pipeline input: False
Accept wildcard characters: False
```

### -EventId

Specifies EventID to be used

```yaml
Type: Int32
Parameter Sets: (All)
Aliases: Id

Required: False
Position: 2
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -MessageTemplate

Specifies message to add to event log.  When message has placeholders (_{0}_),
**Data** attribute contents is inserted into placeholders.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Source

Specifies event provider to use when adding Event Log entry.

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

[WriteEvent method](https://docs.microsoft.com/dotnet/api/system.diagnostics.eventlog.writeevent)
