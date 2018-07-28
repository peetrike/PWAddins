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
PS C:\> Get-OsVersion
```

Returns OS version

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Version

## NOTES

The version returned might sometimes be incorrect. Starting with Windows 8, the returned version has the same major and minor version numbers for all Windows platforms.  Unless te application is aware of newer windows versions and it declares that on app maifest (look at [Operating system version changes in Windows 8.1 and Windows Server 2012 R2](https://msdn.microsoft.com/windows/compatibility/operating-system-version-changes-in-windows-8-1)).  And Powershell sometimes qualifies, and sometimes not.

## RELATED LINKS

[Environment.OSVersion Property](https://docs.microsoft.com/en-us/dotnet/api/system.environment.osversion)

[Win32_OperatingSystem class](https://docs.microsoft.com/en-us/windows/desktop/CIMWin32Prov/win32-operatingsystem)
