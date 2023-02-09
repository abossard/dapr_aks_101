
if ($args.Length -eq 0)  {
    Write-Host "Please provide the Dapr version you want to install" -foregroundColor Red -BackGroundColor Black
    Write-Host "Version must be vx.y.z"
    exit
}

$Dapr_Version = $args[0]
$InstallationDirectory = "c:\Prj\dapr"
$InstallationPostDirectory = ".dapr\bin"

$MYPATH = Get-ItemPropertyValue HKCU:\Environment -Name Path
if (!$MYPATH.Contains($InstallationDirectory))
{
    $MYPATH += ";" + $InstallationDirectory

    Set-ItemProperty -Path HKCU:\Environment -Name Path -Value $MYPATH
}

$Env:DAPR_INSTALL_DIR = $InstallationDirectory
$script=iwr -useb https://raw.githubusercontent.com/dapr/cli/master/install/install.ps1; $block=[ScriptBlock]::Create($script); invoke-command -ScriptBlock $block -ArgumentList "", "$Env:DAPR_INSTALL_DIR"
cp .\ldapr.ps1 $InstallationDirectory
cd $InstallationDirectory
if (Test-Path $InstallationPostDirectory) 
{ 
    Remove-Item -Recurse -Force $InstallationPostDirectory
}
md $InstallationPostDirectory
iwr -Uri "https://github.com/dapr/dapr/releases/download/$($Dapr_Version)/daprd_windows_amd64.zip" -Outfile ".\daprd_windows_amd64.zip"
Expand-Archive daprd_windows_amd64.zip -DestinationPath .\.dapr\bin
Remove-Item daprd_windows_amd64.zip


