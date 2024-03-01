---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version: https://github.com/peetrike/PWAddins/tree/master/Docs/en-US/Get-OsVersion.md
schema: 2.0.0
---

# Get-OsVersion

## SYNOPSIS

Returns Operating System Version

## SYNTAX

```
Get-OsVersion [[-Type] <String>] [<CommonParameters>]
```

## DESCRIPTION

This function returns Windows version.  The output type depends on _-Type_ parameter.
The information is obtainer from registry and using **Environment** class.

## EXAMPLES

### Example 1

```powershell
Get-OsVersion
```

Returns OS version

### Example 2

```powershell
Get-OsVersion -Type Object
```

Returns OS version information as custom object.

## PARAMETERS

### -Type

Specifies output type

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Object, String, Version

Required: False
Position: 0
Default value: Version
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

This function has no input

## OUTPUTS

### System.Version

OS version as **Version**

### String

OS version as string.  Tries to resemble version as `winver.exe` shows

### PWAddins.OSVersion

Custom object containing information about OS version

## NOTES

The version returned might sometimes be incorrect. Starting with Windows 8,
the returned version has the same major and minor version numbers for all
Windows platforms, unless te application is aware of newer windows versions and
it declares that on app manifest (look at
[Windows version check](https://learn.microsoft.com/windows/compatibility/windows-version-check)).
And Powershell sometimes qualifies, sometimes not.

## RELATED LINKS

[Environment.OSVersion Property](https://learn.microsoft.com/dotnet/api/system.environment.osversion)

[Win32_OperatingSystem class](https://learn.microsoft.com/windows/desktop/CIMWin32Prov/win32-operatingsystem)
