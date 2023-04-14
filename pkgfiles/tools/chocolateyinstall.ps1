$ErrorActionPreference = 'Stop';

$packageName  = 'urbackup-client'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = ''

$pp = Get-PackageParameters
if (!$pp.TrayIcon){ 
	$pp.TrayIcon = 'False' 
	$UrExe = 'https://hndl.urbackup.org/Client/2.4.10/UrBackup%20Client%20NoTray%202.4.10.exe'
	$ChkSum = '9E9261B753DF74C36B44FCCF2129D25FAB631C1600ED861C0795CC6E442A4E9B'
}
if ($pp.TrayIcon -eq 'False'){
	$UrExe = 'https://hndl.urbackup.org/Client/2.4.10/UrBackup%20Client%20NoTray%202.4.10.exe'
	$ChkSum = '9E9261B753DF74C36B44FCCF2129D25FAB631C1600ED861C0795CC6E442A4E9B'
}
if ($pp.TrayIcon -eq 'True'){
	$UrExe = 'https://hndl.urbackup.org/Client/2.4.10/UrBackup%20Client%202.4.10.exe'
	$ChkSum = '727B31ED6400DEDC48E3C362014FB85970D50799BFE084316EB79A028C37E434'
}

#Based on Nsis
$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'urbackup-client*'
  fileType      = 'exe'
  silentArgs    = "/S"
  validExitCodes= @(0)
  url           = $UrExe
  checksum      = $ChkSum
  checksumType  = 'sha256'
  url64bit      = ""
  checksum64    = ''
  checksumType64= 'sha256'
  destination   = $toolsDir
  #installDir   = "" # passed when you want to override install directory - requires licensed editions 1.9.0+
}

Install-ChocolateyPackage @packageArgs