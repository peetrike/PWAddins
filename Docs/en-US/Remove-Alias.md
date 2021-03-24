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
Remove-Alias [-Name] <String[]> [-Force] [-Scope <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION

The command removes alias from the current session.

## EXAMPLES

### EXAMPLE 1

```powershell
Remove-Alias -Name myalias
```

This command removes alias named myalias

### EXAMPLE 2

```powershell
Get-Alias test* | Remove-Alias
```

This command removes all aliases that will be found by pattern test*

## PARAMETERS

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

### -Force

Indicates that the cmdlet removes an alias, including aliases with the Option
property set to ReadOnly.
The Force parameter can't remove an alias with an Option property set to
Constant.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name

Specifies the alias to be removed.
Wildcards are permitted.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: True
```

### -Scope

Affects only the aliases in the specified scope. The default scope is Local.
For more information, see [about_Scopes](https://docs.microsoft.com/powershell/module/microsoft.powershell.core/about/about_scopes).

The acceptable values for this parameter are:

- Global
- Local
- Script
- A number relative to the current scope (0 through the number of scopes, where
  0 is the current scope and 1 is its parent)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Local
Accept pipeline input: False
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Management.Automation.AliasInfo

Alias to be removed

## OUTPUTS

### None

## NOTES

This function is not required for PowerShell 7

## RELATED LINKS

[Get-Alias](https://docs.microsoft.com/powershell/module/microsoft.powershell.utility/get-alias)

[New-Alias](https://docs.microsoft.com/powershell/module/microsoft.powershell.utility/new-alias)

[Set-Alias](https://docs.microsoft.com/powershell/module/microsoft.powershell.utility/set-alias)
