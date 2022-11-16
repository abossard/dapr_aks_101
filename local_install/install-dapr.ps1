$InstallationDirectory = "c:\Prj\dapr"
$Env:DAPR_INSTALL_DIR = $InstallationDirectory
$Env:USERPROFILE = $InstallationDirectory
$script=iwr -useb https://raw.githubusercontent.com/dapr/cli/master/install/install.ps1; $block=[ScriptBlock]::Create($script); invoke-command -ScriptBlock $block -ArgumentList "", "$Env:DAPR_INSTALL_DIR"