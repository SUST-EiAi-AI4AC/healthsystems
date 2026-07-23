Set-Location -Path $PSScriptRoot

Write-Host "=== Starting Garmin Sync Task ===" -ForegroundColor Green

# 自动检测优先使用 C:\jscript\python.exe
$PYTHON_EXEC = "python"
if (Test-Path "C:\jscript\python.exe") {
    $PYTHON_EXEC = "C:\jscript\python.exe"
}

Write-Host "Using Python Executable: $PYTHON_EXEC" -ForegroundColor Cyan

& $PYTHON_EXEC sync_garmin.py

Write-Host "=== Garmin Sync Task Completed ===" -ForegroundColor Green
