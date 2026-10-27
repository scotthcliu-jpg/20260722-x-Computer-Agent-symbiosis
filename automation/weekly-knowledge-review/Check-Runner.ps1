param(
    [ValidateSet('codex', 'claude', 'gemini')]
    [string]$Agent
)

$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).Path
$configPath = Join-Path $PSScriptRoot 'config.json'
$config = Get-Content -LiteralPath $configPath -Raw -Encoding UTF8 | ConvertFrom-Json

if ($config.schema_version -ne 1) { throw 'Unsupported config schema.' }
if ($config.selected_agent -notin @('codex', 'claude', 'gemini')) { throw 'Invalid selected agent.' }
$selectedAgent = if ($Agent) { $Agent } else { $config.selected_agent }
if ($config.timezone -ne 'Asia/Taipei' -or $config.day_of_week -ne 'Sunday' -or $config.local_time -ne '20:00') {
    throw 'Unexpected schedule. Review the contract before changing it.'
}

$workflowPath = (Resolve-Path -LiteralPath (Join-Path $projectRoot $config.workflow)).Path
$rootPrefix = $projectRoot.TrimEnd('\', '/') + [IO.Path]::DirectorySeparatorChar
if (-not $workflowPath.StartsWith($rootPrefix, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Workflow path is outside the project root.'
}

$agentCommands = @{
    codex = 'codex'
    claude = 'claude'
    gemini = 'gemini'
}
$command = Get-Command $agentCommands[$selectedAgent] -ErrorAction SilentlyContinue
$vaultAvailable = Test-Path -LiteralPath $config.vault
$task = Get-ScheduledTask -TaskName $config.task_name -ErrorAction SilentlyContinue

[pscustomobject]@{
    job_id = $config.job_id
    activation = $config.activation
    selected_agent = $selectedAgent
    schedule = "$($config.day_of_week) $($config.local_time) $($config.timezone)"
    workflow = $workflowPath
    command_available = ($null -ne $command)
    vault_available = $vaultAvailable
    runtime_prerequisites_met = ($null -ne $command -and $vaultAvailable)
    schedule_installed = ($null -ne $task)
    schedule_state = if ($task) { [string]$task.State } else { 'missing' }
    mode = $config.default_mode
} | ConvertTo-Json -Depth 3
