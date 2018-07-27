---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version:
schema: 2.0.0
---

# Import-Credential

## SYNOPSIS
Imports previously saved credential

## SYNTAX

```
Import-Credential [-Name] <String> [[-Path] <Object>] [<CommonParameters>]
```

## DESCRIPTION
This function imports credential object from a file.

## EXAMPLES

### EXAMPLE 1
```
$MyCredential = Import-Credential -Name 'Me@server'
```

## PARAMETERS

### -Name
Specifies the name of saved credential

```yaml
Type: String
Parameter Sets: (All)
Aliases: FileName

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Specifies the path where credentials are stored.
By default this is subfolder under Local Application Data

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: (Join-Path -Path $env:LOCALAPPDATA -ChildPath 'Powershell')
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### None or [PSCredential]

## NOTES

## RELATED LINKS

[Export-Credential](Export-Credential.md)

[get-credential](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/get-credential)

[Securely Store Credentials on Disk](http://www.powershellcookbook.com/recipe/PukO/securely-store-credentials-on-disk)
