---
external help file: PWAddins-help.xml
Module Name: PWAddins
online version:
schema: 2.0.0
---

# Test-IsAdmin

## SYNOPSIS
Tells whether the current user is an administrator.

## SYNTAX

```
Test-IsAdmin [<CommonParameters>]
```

## DESCRIPTION
The Test-IsAdmin function determines whether the current user is a member of the
Administrators group on the local computer.
It returns TRUE if a user is an administrator and FALSE otherwise.
This function has no parameters.

## EXAMPLES

### EXAMPLE 1
```
Test-IsAdmin
```
```Output
False
```

### EXAMPLE 2
```Powershell
function prompt {
  if (Test-IsAdmin) { '\[ADMIN\]: ' }
  else {
    $(if (test-path variable:/PSDebugContext) { '\[DBG\]: ' }
      else { '' }) + 'PS ' + $(Get-Location) + $(if ($nestedpromptlevel -ge 1) { '\>\>' }) + '\> '
}
```

This prompt uses the Test-IsAdministrator function to change the prompt when the user is an administrator.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Boolean

## NOTES

## RELATED LINKS

[Start-AsAdmin](Start-AsAdmin.md)
