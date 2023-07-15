## Update Firefox to latest version
## Create install files location.

$path = Test-Path C:\_temp
if ($path -eq $false){
    mkdir C:\_temp
} 

## Download and install Firefox
cd C:\_temp
curl -o Firefox.exe "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"
.\Firefox.exe -ms
