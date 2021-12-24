param (
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String]$outputdir, $inputdir
)

Get-ChildItem -Path $inputdir -Filter *.csv | 
Foreach-Object {
    $fileNames = Get-ChildItem -Path $inputdir -Recurse -Include *.csv
    Import-Csv $fileNames | Export-Csv $outputdir\InTuneDevices.csv -notype 
    break
}