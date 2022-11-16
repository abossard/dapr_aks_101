$InstallationDirectory = "c:\Prj\dapr"
$Env:DAPR_INSTALL_DIR = $InstallationDirectory
$Env:USERPROFILE = $InstallationDirectory
$ScriptPath = $InstallationDirectory + "\dapr.exe"
& $ScriptPath @args