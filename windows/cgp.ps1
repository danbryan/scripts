# Create a Profile if it doesn't existy
if (!(Test-Path -Path $PROFILE ))
{ New-Item -Type File -Path $PROFILE -Force }

# Add cgp function to users profile.
Add-Content -Path $PROFILE -Value 'function cgp {'
Add-Content -Path $PROFILE -Value '$env:gopath = (Get-Item -Path ".\" -Verbose).FullName'
Add-Content -Path $PROFILE -Value 'echo "Updated GOPATH: $env:gopath"'
Add-Content -Path $PROFILE -Value '}'