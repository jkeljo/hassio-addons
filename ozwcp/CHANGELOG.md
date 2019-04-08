# Changelog

## [1.1.1] - 2019-04-08
### Fixed
* Added `arch` field to `config.json` (required beginning with Hass.io 151)

## [1.1.0] - 2019-03-25
### Changed
* Updated to latest OZW and OZWCP
### Fixed
* Don't fail if hass has already stopped

## [1.0.4] - 2018-10-14
### Fixed
* Updated config for hassio role-based security	(home-assistant/hassio#692)

## [1.0.3] - 2018-08-11
### Fixed
* Fixed typo in `aarch64` build config that prevented installing on aarch64 systems

## [1.0.2] - 2018-04-24
### Fixed
* Fixed issue with zwave sticks that mount with names other than `/dev/TTYACM0`

## [1.0.1] - 2018-04-07
### Fixed
* Fix `/root/ozwcp.sh: line 12: xmlstarlet: command not found` when starting

## [1.0] - 2018-04-06
Initial release!
