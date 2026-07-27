"""
Upload via SSH exec_command + stdin pipe (cat >), bypassing SFTP subsystem.
More reliable for large files on Aliyun which may drop SFTP connections.
"""
import paramiko
import os
import sys
import time

hostname = "47.109.49.174"
username = "root"
password = "nwpuhs@ABC123!@#"

project_root = r"e:\Code\AI\Start\Web\Mindapp\healthsystems"
local_jar = os.path.join(
    project_root,
    r"healthsystem-backend6\healthsystem-backend\target\backend-0.0.1-SNAPSHOT.jar"
)
remote_jar = "/healthsystem-test/backend-0.0.1-SNAPSHOT.jar"

if not os.path.exists(local_jar):
    print(f"Error: Local JAR file not found: {local_jar}")
    sys.exit(1)

file_size = os.path.getsize(local_jar)
print(f"JAR size: {file_size / 1024 / 1024:.1f} MB")

CHUNK_SIZE = 65536   # 64 KB chunks


def connect_ssh():
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(
        hostname,
        username=username,
        password=password,
        timeout=60,
        banner_timeout=60,
        auth_timeout=60,
    )
    transport = client.get_transport()
    transport.set_keepalive(15)                        # keepalive every 15s
    transport.window_size = 4 * 1024 * 1024
    transport.packetizer.REKEY_BYTES = pow(2, 40)      # don't rekey mid-transfer
    transport.packetizer.REKEY_PACKETS = pow(2, 40)
    return client


def upload_via_stdin(ssh, local_path, remote_path):
    """Stream file through SSH exec_command stdin (cat >). No SFTP involved."""
    tmp_path = remote_path + ".uploading"
    print(f"Opening remote file: {tmp_path}")
    stdin, stdout, stderr = ssh.exec_command(f"cat > '{tmp_path}'", timeout=600)
    stdin.channel.setblocking(True)

    sent = 0
    last_pct = 0
    start = time.time()

    with open(local_path, "rb") as f:
        while True:
            chunk = f.read(CHUNK_SIZE)
            if not chunk:
                break
            stdin.write(chunk)
            sent += len(chunk)
            pct = sent * 100 // file_size
            if pct >= last_pct + 5:
                last_pct = (pct // 5) * 5
                elapsed = time.time() - start
                speed = sent / elapsed / 1024 / 1024 if elapsed > 0 else 0
                print(f"  {last_pct}%  {sent//1024//1024}MB / {file_size//1024//1024}MB  @ {speed:.1f} MB/s")

    stdin.channel.shutdown_write()
    # Wait for command to finish
    exit_status = stdout.channel.recv_exit_status()
    err_out = stderr.read().decode('utf-8', errors='ignore').strip()

    if exit_status != 0:
        raise RuntimeError(f"cat command failed (exit {exit_status}): {err_out}")

    # Atomically move tmp to final path
    mv_stdin, mv_stdout, mv_stderr = ssh.exec_command(f"mv '{tmp_path}' '{remote_path}'")
    mv_exit = mv_stdout.channel.recv_exit_status()
    mv_err = mv_stderr.read().decode('utf-8', errors='ignore').strip()
    if mv_exit != 0:
        raise RuntimeError(f"mv failed: {mv_err}")

    print(f"Upload finished in {time.time()-start:.1f}s")


MAX_RETRIES = 3
ssh = None

for attempt in range(1, MAX_RETRIES + 1):
    try:
        print(f"\nConnecting SSH to {hostname}... (attempt {attempt}/{MAX_RETRIES})")
        ssh = connect_ssh()
        print("Connected.")
        upload_via_stdin(ssh, local_jar, remote_jar)
        break
    except Exception as e:
        print(f"Attempt {attempt} failed: {e}")
        try:
            if ssh:
                ssh.close()
        except Exception:
            pass
        ssh = None
        if attempt < MAX_RETRIES:
            wait = 15 * attempt
            print(f"Retrying in {wait}s...")
            time.sleep(wait)
        else:
            print("All upload attempts failed. Aborting.")
            sys.exit(1)

# ── Restart service ──────────────────────────────────────────────────────────
print("\nRestarting healthsystem service...")
_, stdout, stderr = ssh.exec_command(
    "systemctl restart healthsystem && sleep 10 && systemctl is-active healthsystem",
    timeout=90
)
out = stdout.read().decode('utf-8', errors='ignore').strip()
err = stderr.read().decode('utf-8', errors='ignore').strip()
print("Service status:", out if out else "(no output)")
if err:
    print("Stderr:", err)

# ── Port check ───────────────────────────────────────────────────────────────
time.sleep(3)
_, stdout, _ = ssh.exec_command("ss -lntp | grep -E ':(8081|1443)'", timeout=15)
port_out = stdout.read().decode('utf-8', errors='ignore').strip()
print("Listening ports:")
print(port_out if port_out else "  (service still starting - check again in 30s)")

ssh.close()
print("\n[SUCCESS] Deployment finished successfully!")
