<# 
=============================================================================
Work out the date of a day in the month. Eg. 2nd Tuesday of the Month
=============================================================================
Version: 1
Last edited by: jeanpaul.bonjour@agilisys.co.uk
#>

<# 
=============================================================================
Modified to use get-date in case there is a problem in Azure with [datetime]
=============================================================================
#>


#:: Variables
#: Which # of the day of the month. Eg. 2nd 
$FindNthDay=2

#: Day of the week.
$WeekDay='Tuesday'

#:: Working out the date for the specified Day of the month
$Today=Get-Date
# Write-Output "Todays date: $($Today.date)"
$StartMonth=Get-Date -day 1     #: Get the date of the start of the month
# Write-Output "First of the month: $($StartMonth.date)" 
while ($StartMonth.DayofWeek -ine $WeekDay ) {
    $StartMonth=$StartMonth.AddDays(1)
}
#:: Store the Target date
$TargetDate = $StartMonth.AddDays(7*($FindNthDay-1))
# Write-Output "Target date: $($TargetDate.date)" 

#:: Compare the Target date to todays date.
IF ($TargetDate.date -ne $Today.date) {
    Write-Host "Not equal"
    Exit
}

Write-Host "equal"


<# 
=============================================================================
Original code using [datetime]
=============================================================================
#>

#:: Variables
#: Which # of the day of the month. Eg. 2nd 
$FindNthDay=2

#: Day of the week.
$WeekDay='Friday'

#:: Working out the date for the specified Day of the month
[datetime]$Today=[datetime]::NOW
$todayM=$Today.Month.ToString()
$todayY=$Today.Year.ToString()
[datetime]$StrtMonth=$todayM+'/1/'+$todayY
while ($StrtMonth.DayofWeek -ine $WeekDay ) {
    $StrtMonth=$StrtMonth.AddDays(1)
}

#:: Store the Target date
$TargetDate = $StrtMonth.AddDays(7*($FindNthDay-1))

#:: Compare the Target date to todays date.
IF ($TargetDate -ne $Today.date) {
    Write-Host "Not equal"
    Exit
}

Write-Host "equal"