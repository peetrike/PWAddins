# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## Unreleased

## [1.8.1] 2023-07-13

### Removed

- Update-LocalModule: moved to another module

## [1.8.0] 2022-02-07

### Added

- Get-EnumValue - returns all enum values in text and number format.
- Get-TypeUrl - generates documentation Url for System/Microsoft namespace types

### Changed

- Get-HostName - returns FQDN faster.

## [1.7.1] 2022-02-07

### Added

- Get-Accelerator - added -Name parameter to filter results.

### Fixed

- Start-PSv2 - fix starting v2 session without command line parameters.

## [1.7.0] 2022-01-10

### Added

- Start-PSv2 - starts PowerShell v2 session and writes about that to event log

## [1.6.1] 2021-03-30

### Changed

- Get-HostName - changed inner discovery of FQDN

## [1.6.0] 2021-03-24

### Changed

- Start-AsAdmin - changed parameter -WindowStyle type to _ProcessWindowStyle_
- Remove-Alias - with `pwsh` use built-in cmdlet instead `Remove-Item`

## [1.5.0] 2021-01-05

### Removed

- Measure-History (and alias `howlong`)

### Added

- Get-Accelerator
- Get-HostName
- Invoke-WithCulture
- Modified TypeData and FormatData for HistoryInfo

### Changed

- Start-AsAdmin
  - now supports -Whatif and -Confirm
  - now in PowerShell 7 starts `pwsh` as admin

## [1.4.1] 2018-07-27

### Changed

- modified markdown help
- added external help to functions

## [1.4.0] 2018-07-27

### Added

- added markdown-based help
- added new functions

### Changed

- changed module loading and folder structure

## [1.3.2] 2018-07-09

### Fixed

- fixed Update-LocalModule
  - Update-LocalModule didn't force install from repository already existing local modules

## [1.3.1] 2018-07-09

### Changed

- changed Update-Localmodule

### Fixed

- fixed issue #6 in Update-LocalModule

## [1.3.0] 2018-07-07

### Added

- Added Update-LocalModule

## [1.2.0] 2018-07-05

### Added

- added Get-OsVersion

### Changed

- Added splatting to Start-AsAdmin
- Added error handling to Measure-History
- changed Remove-Alias

## [1.1.1] 2018-07-04

### Changed

- Changed Measure-History

## [1.1.0]

### Added

- added module manifest
