import ssl
import OpenSSL
from OpenSSL import crypto
import datetime

hostname = 'www.nwpuhs.cn'
port = 443

try:
    cert_pem = ssl.get_server_certificate((hostname, port))
    x509 = crypto.load_certificate(crypto.FILETYPE_PEM, cert_pem)
    not_after = x509.get_notAfter().decode('ascii')
    # Format of not_after is YYYYMMDDhhmmssZ
    expire_date = datetime.datetime.strptime(not_after, '%Y%m%d%H%M%SZ')
    print(f"Certificate expires on: {expire_date} (UTC)")
    print(f"Current UTC time: {datetime.datetime.utcnow()}")
    print(f"Expired: {expire_date < datetime.datetime.utcnow()}")
except Exception as e:
    print(f"Error: {e}")
