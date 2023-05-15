$ErrorActionPreference = 'Stop';

$packageName  = 'urbackup-client'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = ''

$pp = Get-PackageParameters
# default to False
if (!$pp.TrayIcon){ 
	$pp.TrayIcon = 'False'
  $UrExe = 'https://hndl.urbackup.org/Client/2.5.24/UrBackup%20Client%20NoTray%202.5.24.exe'
	$ChkSum = '20A450644392245F456D0A22A73D460E17D8EE7C4DFD1DAD8D084BD6F58525CB'
}
if ($pp.TrayIcon -eq 'False'){
	$UrExe = 'https://hndl.urbackup.org/Client/2.5.24/UrBackup%20Client%20NoTray%202.5.24.exe'
	$ChkSum = '20A450644392245F456D0A22A73D460E17D8EE7C4DFD1DAD8D084BD6F58525CB'
}
if ($pp.TrayIcon -eq 'True'){
	$UrExe = 'https://hndl.urbackup.org/Client/2.5.24/UrBackup%20Client%202.5.24.exe'
	$ChkSum = '58E64B68B807BF467548A79774D01E50A42F7F712B3278C92C0EBDFC93A1A8C8'
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