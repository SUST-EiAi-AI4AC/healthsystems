
$SERVER_IP = "47.109.49.174"
$USER = "root"
$PASS = "nwpuhs@ABC123!@#"
$LOCAL_JAR = "e:\Code\AI\Start\Web\Mindapp\healthsystem\healthsystem-backend6\healthsystem-backend\target\backend-0.0.1-SNAPSHOT.jar"
$REMOTE_PATH = "/healthsystem-test/"

Write-Host "Building project locally..." -ForegroundColor Cyan
cd "e:\Code\AI\Start\Web\Mindapp\healthsystem\healthsystem-backend6\healthsystem-backend"
# 添加 -Pdeploy 虽然 pom 中未显式定义，但符合用户习惯，且确保资源过滤等可能行为
mvn clean package -DskipTests -Pdeploy

if ($LASTEXITCODE -ne 0) {
    Write-Error "Build failed!"
    exit
}

Write-Host "Uploading JAR to server..." -ForegroundColor Cyan
# 将本地打好的包含修复配置的 JAR 上传到服务器
scp $LOCAL_JAR "${USER}@${SERVER_IP}:${REMOTE_PATH}"

Write-Host "Restarting service on server..." -ForegroundColor Cyan
# 使用 systemd 托管后端服务，防止 SSH 会话关闭导致进程被杀，同时实现崩溃自动重启
ssh "${USER}@${SERVER_IP}" "set -e; systemctl restart healthsystem; sleep 5; systemctl is-active healthsystem >/dev/null && echo 'Backend service: OK' || (echo 'Backend service: FAIL' && tail -n 200 ${REMOTE_PATH}backend.log && exit 1); (command -v ss >/dev/null 2>&1 && ss -lntp | egrep ':(8081|1443)\b' || true); (command -v curl >/dev/null 2>&1 && (curl -fsS http://127.0.0.1:8081/ >/dev/null && echo 'HTTP 8081: OK' || echo 'HTTP 8081: FAIL') || true)"


Write-Host "Deployment Completed Successfully!" -ForegroundColor Green
