from cryptography.hazmat.primitives.serialization import pkcs12
import datetime

pfx_file = "healthsystem-backend6/healthsystem-backend/src/main/resources/nwpuhs.cn.pfx"
pass_file = "healthsystem-backend6/healthsystem-backend/src/main/resources/pfx-password.txt"

with open(pass_file, "r") as pf:
    password = pf.read().strip()

print(f"Reading PFX: {pfx_file}")
try:
    with open(pfx_file, "rb") as f:
        pfx_data = f.read()
    
    private_key, cert, additional_certs = pkcs12.load_key_and_certificates(pfx_data, password.encode('utf-8'))
    print("PFX parsed successfully!")
    print(f"Subject: {cert.subject}")
    print(f"Issuer: {cert.issuer}")
    print(f"Not Valid Before: {cert.not_valid_before_utc}")
    print(f"Not Valid After: {cert.not_valid_after_utc}")
    print(f"Expired: {cert.not_valid_after_utc.replace(tzinfo=None) < datetime.datetime.utcnow()}")
except Exception as e:
    print(f"Error: {e}")
