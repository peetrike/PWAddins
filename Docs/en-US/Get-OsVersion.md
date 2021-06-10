---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version: https://github.com/peetrike/PWAddins/blob/master/Docs/Get-OsVersion.md
schema: 2.0.0
---

# Get-OsVersion

## SYNOPSIS

Returns Operating System Version

## SYNTAX

```
Get-OsVersion [<CommonParameters>]
```

## DESCRIPTION

This function returns Windows version as [Ssytem.Version] object.

## EXAMPLES

### Example 1

```powershell
Get-OsVersion
```

Returns OS version

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Version

## NOTES

The version returned might sometimes be incorrect. Starting with Windows 8,
the returned version has the same major and minor version numbers for all
Windows platforms, unless te application is aware of newer windows versions and
it declares that on app manifest (look at
[Windows version check](https://docs.microsoft.com/windows/compatibility/windows-version-check)).
And Powershell sometimes qualifies, sometimes not.

## RELATED LINKS

[Environment.OSVersion Property](https://docs.microsoft.com/dotnet/api/system.environment.osversion)

[Win32_OperatingSystem class](https://docs.microsoft.com/windows/desktop/CIMWin32Prov/win32-operatingsystem)
