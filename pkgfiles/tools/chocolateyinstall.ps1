$ErrorActionPreference = 'Stop';

$packageName  = 'urbackup-client'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = ''

$pp = Get-PackageParameters
if (!$pp.TrayIcon){ 
	$pp.TrayIcon = 'False' 
	$UrExe = 'https://hndl.urbackup.org/Client/2.5.23/UrBackup%20Client%20NoTray%202.5.23.exe'
	$ChkSum = '814B39E44A1C31A84B09756AD121487C4453AA3D4CE49DCABCBE49113784C426'
}
if ($pp.TrayIcon -eq 'False'){
	$UrExe = 'https://hndl.urbackup.org/Client/2.5.23/UrBackup%20Client%20NoTray%202.5.23.exe'
	$ChkSum = '814B39E44A1C31A84B09756AD121487C4453AA3D4CE49DCABCBE49113784C426'
}
if ($pp.TrayIcon -eq 'True'){
	$UrExe = 'https://hndl.urbackup.org/Client/2.5.23/UrBackup%20Client%202.5.23.exe'
	$ChkSum = 'B1B3B859981708E1E10DC9AAA1DD179533CF0F8BCD08DC2B4BC5D71CC549B07D'
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