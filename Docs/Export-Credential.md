---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version:
schema: 2.0.0
---

# Export-Credential

## SYNOPSIS
Stores credential objects in .xml file

## SYNTAX

```
Export-Credential [-Credential] <PSCredential> [-Name] <String> [[-Path] <String>] [<CommonParameters>]
```

## DESCRIPTION
This function saves given credential to .xml file in predefined path.
The path is by default in Local Application Data folder.

You must also determine the name of saved credential

## EXAMPLES

### EXAMPLE 1
```
Get-Credential | Export-Credential -Name 'me@server'
```

### EXAMPLE 2
```
Export-Credential -Credential $MyCredential -Name 'me@server'
```

### EXAMPLE 3
```
[PSCustomObject] @{ Name = 'me@server' ; Credential = $MyCredential } | Export-Credential
```

## PARAMETERS

### -Credential
Specifies the Credential that will be saved.
Type a user name, such as User01
or Domain01\User01, or enter a PSCredential object, such as one from the Get-Credential cmdlet.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Name
Specify a name for stored credential.

```yaml
Type: String
Parameter Sets: (All)
Aliases: FileName

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Path
Specify a path where the credential will be stored.
By default it is a subfolder in Local Application Data folder

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: (Join-Path -Path $env:LOCALAPPDATA -ChildPath 'Powershell')
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### [PSCredential]
Takes credential object from pipe.

## OUTPUTS

### None

## NOTES

## RELATED LINKS

[Import-Credential](Import-Credential.md)

[Get-Credential](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/get-credential)

[Export-CliXml](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/export-clixml)

[Securely Store Credentials on Disk](http://www.powershellcookbook.com/recipe/PukO/securely-store-credentials-on-disk)
