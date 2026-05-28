param(
  [string]$Profile = "default"
)

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  Starting HealthSystem Backend..." -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

$ErrorActionPreference = "Stop"

$backendDir = Join-Path $PSScriptRoot "healthsystem-backend6\healthsystem-backend"
if (-not (Test-Path -Path $backendDir)) {
  throw "Backend directory not found: $backendDir"
}
Set-Location $backendDir

$portsToCheck = @(1443, 8081)
foreach ($port in $portsToCheck) {
  $connections = Get-NetTCPConnection -State Listen -LocalPort $port -ErrorAction SilentlyContinue
  foreach ($conn in $connections) {
    $owningPid = $conn.OwningProcess
    if (-not $owningPid) { continue }
    $proc = Get-Process -Id $owningPid -ErrorAction SilentlyContinue
    if ($proc -and ($proc.ProcessName -in @("java", "javaw"))) {
      Write-Host "Port $port is in use by $($proc.ProcessName) (PID $owningPid). Stopping it..." -ForegroundColor Yellow
      Stop-Process -Id $owningPid -Force
      Start-Sleep -Milliseconds 300
    }
    elseif ($proc) {
      throw "Port $port is already in use by $($proc.ProcessName) (PID $owningPid). Stop it or change ports in application.yml."
    }
    else {
      throw "Port $port is already in use by PID $owningPid. Stop it or change ports in application.yml."
    }
  }
}

Write-Host "Using Spring profile: $Profile" -ForegroundColor Cyan

if (Get-Command mvn -ErrorAction SilentlyContinue) {
  mvn spring-boot:run "-Dspring-boot.run.profiles=$Profile"
}
elseif ((Test-Path -Path ".\mvnw.cmd") -and (Test-Path -Path ".\.mvn\wrapper\maven-wrapper.properties")) {
  & .\mvnw.cmd spring-boot:run "-Dspring-boot.run.profiles=$Profile"
}
else {
  throw "Maven not found, and mvnw wrapper files are missing (.mvn/wrapper). Install Maven or restore the Maven Wrapper files."
}
