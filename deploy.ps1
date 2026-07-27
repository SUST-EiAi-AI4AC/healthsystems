$PROJECT_ROOT = $PSScriptRoot
$BACKEND_DIR = Join-Path $PROJECT_ROOT "healthsystem-backend6\healthsystem-backend"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  1. Building Backend JAR Locally..." -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

Set-Location $BACKEND_DIR
mvn clean package -DskipTests

if ($LASTEXITCODE -ne 0) {
    Write-Error "Build failed!"
    exit $LASTEXITCODE
}

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  2. Uploading JAR & Restarting Aliyun Server..." -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

$deployPy = Join-Path $PROJECT_ROOT "scratch\upload_and_restart.py"
python $deployPy

if ($LASTEXITCODE -eq 0) {
    Write-Host "==========================================" -ForegroundColor Green
    Write-Host "  Backend Deployment Completed Successfully!" -ForegroundColor Green
    Write-Host "==========================================" -ForegroundColor Green
} else {
    Write-Error "Deployment failed during upload or server restart."
}
