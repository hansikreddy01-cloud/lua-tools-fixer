# LuaTools Fixer Installer
# This script installs and configures LuaTools

Write-Host "Welcome to LuaTools Fixer Installer!" -ForegroundColor Green
Write-Host "Starting installation..." -ForegroundColor Cyan

# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run PowerShell as Administrator!" -ForegroundColor Red
    exit
}

# Define installation path
$installPath = "$env:ProgramFiles\LuaTools"

# Create directory if it doesn't exist
if (-not (Test-Path $installPath)) {
    New-Item -ItemType Directory -Path $installPath -Force | Out-Null
    Write-Host "Created installation directory: $installPath" -ForegroundColor Green
}

# Add to PATH
$pathVariable = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)
if ($pathVariable -notlike "*$installPath*") {
    [Environment]::SetEnvironmentVariable("Path", "$pathVariable;$installPath", [EnvironmentVariableTarget]::Machine)
    Write-Host "Added to PATH" -ForegroundColor Green
}

Write-Host "Installation complete!" -ForegroundColor Green
Write-Host "You can now use LuaTools commands" -ForegroundColor Cyan
