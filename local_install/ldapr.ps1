$Env:DAPR_INSTALL_DIR = $PSScriptRoot
$Env:USERPROFILE = $PSScriptRoot
$ScriptPath = $PSScriptRoot + "\dapr.exe"
& $ScriptPath @args