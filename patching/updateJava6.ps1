### Update Java 6 to Java 8
### Author: Michael Vallerant
### Version: 1.0.0
### Description: Updates Java 6.*.* to 1.8.0.201

# Check current Java version
$currentVersion = (Get-Item 'C:\Program Files (x86)\Java\jre6\bin\java.exe').VersionInfo.ProductVersion
$latestVersion = (Get-Item "C:\_temp\java.exe").VersionInfo.ProductVersion

if ($currentVersion -eq $null) {
     throw "Unable to locate Java installation!"
 } else {
     continue
 }

# Download Java
$path = Test-Path C:\_temp

if ($path -eq $false) {
    mkdir C:\_temp
}
cd C:\_temp
curl.exe -L -o java.exe https://javadl.oracle.com/webapps/download/AutoDL?BundleId=236886_42970487e3af4f5aa5bca3f542482c60 

# Install Java
.\java.exe INSTALL_SILENT=Enable REMOVEOUTOFDATEJRES=1
sleep(120)

# Recheck Java version and throw error if not latest
$updatedVersion =  (Get-Item 'C:\Program Files (x86)\Java\jre1.8.0_201\bin\java.exe').VersionInfo.ProductVersion
if ($updatedVersion -ne $latestVersion) {
    throw "Java update failed!"
}
