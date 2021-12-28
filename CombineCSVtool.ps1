# Setting mandatory parameters for script to work
param (
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$outputdir, $inputdir
)

# Set ErrorActionPreferenc for correct output
$ErrorActionPreference = "Stop"

# Checking if the input directory exists
$inputdirpresent = (Test-Path -Path $inputdir)
If ($inputdirpresent -eq "true") {
    Write-Host "Started combining CSV files..." -ForegroundColor Green
}
else {
    Write-Host "Could not find input directory at $inputdir" -ForegroundColor Red
    exit
}

# Appending CSV files and creating a masterfile
Try {   
    Get-ChildItem -Path $inputdir -Filter *.csv | 
    Foreach-Object {
    $fileNames = Get-ChildItem -Path $inputdir -Recurse -Include *.csv
    Import-Csv $fileNames | Export-Csv $outputdir\InTuneDevices.csv -notype
    }
}
Catch {
    Write-Host "Not able to append CSV files to masterfile. Please check inputs."
    exit
}

# Checking if script was successful
$outputfile = Test-Path -Path $outputdir\InTuneDevices.csv
if ($outputfile -eq "true") {
    Write-Host "Successfully created CSV masterfile at $outputdir" -ForegroundColor Green
}

else {
    Write-Host "CSV file was not created." -ForegroundColor Red
}
