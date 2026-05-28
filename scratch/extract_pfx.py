from cryptography.hazmat.primitives.serialization import pkcs12, PrivateFormat, NoEncryption
from cryptography.hazmat.primitives import serialization
import os

pfx_file = "healthsystem-backend6/healthsystem-backend/src/main/resources/nwpuhs.cn.pfx"
pass_file = "healthsystem-backend6/healthsystem-backend/src/main/resources/pfx-password.txt"

with open(pass_file, "r") as pf:
    password = pf.read().strip()

print(f"Loading PFX from {pfx_file}...")
try:
    with open(pfx_file, "rb") as f:
        pfx_data = f.read()
    
    private_key, cert, additional_certs = pkcs12.load_key_and_certificates(pfx_data, password.encode('utf-8'))
    
    # Export private key in PEM format
    key_pem = private_key.private_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PrivateFormat.TraditionalOpenSSL,
        encryption_algorithm=serialization.NoEncryption()
    )
    
    # Export cert in PEM format
    cert_pem = cert.public_bytes(serialization.Encoding.PEM)
    
    # Build full cert chain
    chain_pem = cert_pem
    if additional_certs:
        for c in additional_certs:
            chain_pem += c.public_bytes(serialization.Encoding.PEM)
            
    # Save key
    key_path = "scratch/www.nwpuhs.cn_key.key"
    with open(key_path, "wb") as kf:
        kf.write(key_pem)
    print(f"Saved private key to {key_path}")
    
    # Save cert chain
    cert_path = "scratch/www.nwpuhs.cn_cert_chain.pem"
    with open(cert_path, "wb") as cf:
        cf.write(chain_pem)
    print(f"Saved certificate chain to {cert_path}")
    
except Exception as e:
    print(f"Error: {e}")
