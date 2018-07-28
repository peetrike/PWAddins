---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version: https://github.com/peetrike/PWAddins/blob/master/Docs/Remove-Alias.md
schema: 2.0.0
---

# Remove-Alias

## SYNOPSIS
Remove an alias from the shell

## SYNTAX

```
Remove-Alias [-Name] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The command removes alias from the current session.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> Remove-Alias -Name myalias
```

This command removes alias named myalias

### EXAMPLE 2
```
PS C:\> Get-Alias test* | Remove-Alias
```

This command removes all aliases that will be found by pattern test*

## PARAMETERS

### -Name
Specifies the alias to be removed.
Wildcards are permitted.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Management.Automation.AliasInfo

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[Get-Alias](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-alias)

[New-Alias](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/new-alias)

[Set-Alias](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/set-alias)
