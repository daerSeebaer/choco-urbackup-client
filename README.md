# choco-urbackup-client

Files for the creation of a chocolatey package for the client versions of UrBackup.

## Installation and Removal
`choco install urbackup-client`

`choco uninstall urbackup-client`

### Installation with Tray Icon

By default, the client version without tray icon will be installed. To choose the version with tray icon, pass the package parameter `/TrayIcon` during install:

`choco install urbackup-client [other options] --params="'/TrayIcon'"`

To have choco remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

## Contributing
Please keep in line with the rules and standards laid out by Chocolatey: https://docs.chocolatey.org/en-us/create/create-packages

## Scope
This repository is only intended for work on that specific package. For general issues with Chocolatey or UrBackup, please consult the respective documentation.
