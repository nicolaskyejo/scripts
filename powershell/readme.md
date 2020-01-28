How to schedule tasks in Windows using
[powershell](https://adamtheautomator.com/powershell-create-scheduled-task/)
or
[task scheduler](https://docs.microsoft.com/en-us/windows/win32/taskschd/using-the-task-scheduler)
```
$Action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument "-NonInteractive -NoLogo -NoProfile -File C:\path\to\script\script.ps1"
$Trigger = New-ScheduledTaskTrigger -Daily -At 10am
$Settings = New-ScheduledTaskSettingsSet
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
Register-ScheduledTask -TaskName 'PowerShell Script' -InputObject $Task
```