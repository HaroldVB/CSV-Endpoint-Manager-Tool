# CSV-Endpoint-Manager-Tool
A tool that combines CSV files so you can easily import your devices into Microsoft Endpoint Manager

The script appends all the hardware hashes into 1 file. You can import this file into Microsoft Endpoint Manager to import multiple devices in one import job.

Please reports bugs or comment with improvements I can make!

# Syntax to use the script

`.\CombineCSVTool.ps1 -inputdir "location of CSV files" -outputdir "where the CSV file will be created"`

# Input directory

`-inputdir`

Please put the full path to the folder containing the .csv files you want to append.

# Output directory

`-outputdir`

Please use the full path of the location where you want to create the InTuneDevices.csv file.
