---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version: https://github.com/peetrike/PWAddins/blob/master/Docs/Start-PSv2.md
schema: 2.0.0
---

# Start-PSv2

## SYNOPSIS

STart PowerShell v2 engine and write that to event log.

## SYNTAX

```
Start-PSv2 [[-ArgumentList] <String[]>] [[-WindowStyle] <ProcessWindowStyle>] [<CommonParameters>]
```

## DESCRIPTION

This function starts PowerShell v2 engine and adds a message
to Windows PowerShell event log about that.

## EXAMPLES

### Example 1

```powershell
Start-PSv2 -ArgumentList '-NoProfile', '-NoExit', '-c dir'
```

This example starts PowerShell v2 engine with specified command line parameters.

## PARAMETERS

### -ArgumentList

Command line parameters to `powershell.exe`

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WindowStyle

Specifies the state of the window that is used for the PowerShell v2 engine.

```yaml
Type: ProcessWindowStyle
Parameter Sets: (All)
Aliases:
Accepted values: Normal, Hidden, Minimized, Maximized

Required: False
Position: 1
Default value: Normal
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
