$ErrorActionPreference = 'Stop';

$packageName  = 'urbackup-client'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = ''

$pp = Get-PackageParameters
# default to False
if (!$pp.TrayIcon){ 
	$pp.TrayIcon = 'False'
}
if ($pp.TrayIcon -eq 'False'){
	$UrExe = 'https://hndl.urbackup.org/Client/2.5.25/UrBackup%20Client%20NoTray%202.5.25.exe'
	$ChkSum = 'E9CCB9E97E5EA55BBF291DAC6AB830DE4E5119A36B27D49DCBEBA83CDF2EFE1E'
}
if ($pp.TrayIcon -eq 'True'){
	$UrExe = 'https://hndl.urbackup.org/Client/2.5.25/UrBackup%20Client%202.5.25.exe'
	$ChkSum = '5FDE17E13F77FCCCCF40706E07271EBA36567F221684C648A4D015734A4CA475'
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