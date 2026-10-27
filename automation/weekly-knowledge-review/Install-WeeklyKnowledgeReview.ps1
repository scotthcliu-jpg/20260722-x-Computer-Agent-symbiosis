$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).Path
$config = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'config.json') -Raw -Encoding UTF8 | ConvertFrom-Json
if ($config.schema_version -ne 1 -or $config.timezone -ne 'Asia/Taipei' -or $config.day_of_week -ne 'Sunday' -or $config.local_time -ne '20:00') {
    throw 'Unexpected schedule contract.'
}
if ((Get-TimeZone).Id -ne 'Taipei Standard Time') { throw 'Host timezone is not Taipei Standard Time.' }
if ($config.default_mode -ne 'preview') { throw 'Only preview installation is supported.' }
if (Get-ScheduledTask -TaskName $config.task_name -ErrorAction SilentlyContinue) {
    throw 'Task already exists. Review it before replacing or editing.'
}

$runner = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot 'Run-WeeklyKnowledgeReview.ps1')).Path
$powershell = Join-Path $env:SystemRoot 'System32\WindowsPowerShell\v1.0\powershell.exe'
$action = New-ScheduledTaskAction -Execute $powershell -Argument "-NoProfile -NonInteractive -WindowStyle Hidden -File `"$runner`"" -WorkingDirectory $projectRoot
$trigger = New-ScheduledTaskTrigger -Weekly -WeeksInterval 1 -DaysOfWeek Sunday -At '20:00'
$principal = New-ScheduledTaskPrincipal -UserId ([Security.Principal.WindowsIdentity]::GetCurrent().Name) -LogonType Interactive -RunLevel Limited
$settings = New-ScheduledTaskSettingsSet -MultipleInstances IgnoreNew -ExecutionTimeLimit (New-TimeSpan -Hours 2) -StartWhenAvailable:$false -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
Register-ScheduledTask -TaskName $config.task_name -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Description 'Single cross-agent weekly knowledge review; current mode is read-only preview.' | Out-Null

$task = Get-ScheduledTask -TaskName $config.task_name -ErrorAction Stop
$taskInfo = Get-ScheduledTaskInfo -TaskName $config.task_name -ErrorAction Stop
[pscustomobject]@{
    task_name = $task.TaskName
    state = [string]$task.State
    next_run = $taskInfo.NextRunTime.ToString('yyyy-MM-dd HH:mm:ss')
    action = $task.Actions[0].Execute
    arguments = $task.Actions[0].Arguments
    trigger_start = $task.Triggers[0].StartBoundary
} | ConvertTo-Json -Depth 3
