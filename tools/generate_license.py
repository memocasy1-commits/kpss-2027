# -*- coding: utf-8 -*-
"""
KPSS Soru Bankası - Asimetrik Lisans İmzası Üretici (Admin Tool)
================================================================
Bu araç geliştiricinin bilgisayarında ÖZEL ANAHTAR (Private Key) ile
kullanıcının Cihaz Kodunu (Device ID) asimetrik olarak imzalar (Ed25519).

Özel Anahtar: Yalnızca bu bilgisayarda 'tools/kpss_license_private.key' içinde bulunur.
Açık Anahtar: APK içine gömülmüştür ve sadece imzayı doğrulamak için kullanılır.
Tersine mühendislik ile APK çözülse dahi özel anahtar olmadığı için lisans üretilemez!

Kullanım:
  python tools/generate_license.py [CihazKodu]
  veya doğrudan çift tıklayarak LISANS_URETICI.bat dosyasını açabilirsiniz.
"""

import os
import sys
import base64
import subprocess
from cryptography.hazmat.primitives.asymmetric import ed25519

if sys.stdout.encoding != 'utf-8':
    try:
        sys.stdout.reconfigure(encoding='utf-8')
    except Exception:
        pass

TOOLS_DIR = os.path.dirname(os.path.abspath(__file__))
KEY_FILE = os.path.join(TOOLS_DIR, "kpss_license_private.key")

def get_or_create_private_key() -> ed25519.Ed25519PrivateKey:
    """Özel anahtarı dosyadan yükler, yoksa güvenli bir şekilde üretir."""
    if os.path.exists(KEY_FILE):
        with open(KEY_FILE, "rb") as f:
            priv_bytes = f.read()
        return ed25519.Ed25519PrivateKey.from_private_bytes(priv_bytes)
    else:
        priv = ed25519.Ed25519PrivateKey.generate()
        priv_bytes = priv.private_bytes_raw()
        with open(KEY_FILE, "wb") as f:
            f.write(priv_bytes)
        print(f"[BİLGİ] Yeni Master Özel Anahtar oluşturuldu ve kaydedildi: {KEY_FILE}")
        return priv

def clean_device_id(raw_id: str) -> str:
    """Temizle ve normalize et: Boşlukları ve tireleri kaldır, büyük harf yap."""
    return raw_id.strip().upper().replace("-", "").replace(" ", "")

def sign_device_id(priv_key: ed25519.Ed25519PrivateKey, device_id: str, duration_type: str = "INF") -> tuple[str, str]:
    """Cihaz kodunu asimetrik olarak Ed25519 ile imzalar ve Base64Url anahtar üretir."""
    norm_id = clean_device_id(device_id)
    
    type_labels = {
        "1D": "1 Günlük Deneme Sürümü",
        "3D": "3 Günlük Deneme Sürümü",
        "7D": "7 Günlük Deneme Sürümü",
        "INF": "Sınırsız / Ömür Boyu VIP Sürüm",
    }
    
    clean_type = duration_type.upper().strip()
    if clean_type in ("1", "1D", "1GÜN", "1GUN"):
        clean_type = "1D"
    elif clean_type in ("3", "3D", "3GÜN", "3GUN"):
        clean_type = "3D"
    elif clean_type in ("7", "7D", "7GÜN", "7GUN"):
        clean_type = "7D"
    else:
        clean_type = "INF"
        
    # Kriptografik imza yükü: "DEVICE_ID:TYPE"
    payload = f"{norm_id}:{clean_type}".encode("utf-8")
    signature_bytes = priv_key.sign(payload)
    
    # Base64Url (padding olmadan)
    b64_url = base64.urlsafe_b64encode(signature_bytes).decode("ascii").rstrip("=")
    license_key = f"ACT-{clean_type}-{b64_url}"
    return license_key, type_labels.get(clean_type, "Bilinmeyen Sürüm")

def copy_to_clipboard(text: str) -> bool:
    """Windows panosuna kopyalar."""
    try:
        process = subprocess.Popen(['clip'], stdin=subprocess.PIPE, shell=True)
        process.communicate(text.encode('utf-8'))
        return True
    except Exception:
        return False

def main():
    print("=" * 65)
    print("   KPSS SORU BANKASI - ASİMETRİK DİJİTAL LİSANS İMZALAYICI")
    print("   (Ed25519 Süreli Deneme & Sınırsız Lisans Motoru)")
    print("=" * 65)

    priv_key = get_or_create_private_key()

    raw_code = ""
    duration_choice = "INF"

    if len(sys.argv) > 1:
        raw_code = sys.argv[1]
        if len(sys.argv) > 2:
            duration_choice = sys.argv[2]
    else:
        try:
            raw_code = input("\nLütfen Kullanıcının İlettiği Cihaz Kodunu Giriniz: ").strip()
            print("\nLisans Süresi Seçiniz:")
            print("  [1] 1 Günlük Deneme Sürümü")
            print("  [2] 3 Günlük Deneme Sürümü")
            print("  [3] 7 Günlük Deneme Sürümü")
            print("  [4] Sınırsız / Ömür Boyu Tam Sürüm (Varsayılan: Enter)")
            secim = input("Seçiminiz (1/2/3/4) [4]: ").strip()
            if secim == "1":
                duration_choice = "1D"
            elif secim == "2":
                duration_choice = "3D"
            elif secim == "3":
                duration_choice = "7D"
            else:
                duration_choice = "INF"
        except (KeyboardInterrupt, EOFError):
            print("\nİşlem iptal edildi.")
            return

    if not raw_code:
        print("\n[HATA] Geçerli bir Cihaz Kodu girmediniz!")
        return

    norm_code = clean_device_id(raw_code)
    license_key, type_label = sign_device_id(priv_key, norm_code, duration_choice)
    
    copied = copy_to_clipboard(license_key)

    print("\n" + "-" * 65)
    print("                   LİSANS DETAYLARI")
    print("-" * 65)
    print(f" Girilen Cihaz Kodu : {raw_code}")
    print(f" Normalize ID       : {norm_code}")
    print(f" Lisans Tipi        : {type_label}")
    print(f" AKTİVASYON ŞİFRESİ :\n\n{license_key}\n")
    if copied:
        print(" [✓] Şifre otomatik olarak Windows panonuza kopyalandı!")
    print("-" * 65)
    print("✓ Kullanıcıya yukarıdaki 'AKTİVASYON ŞİFRESİ'ni iletiniz.")
    print("  Kullanıcı şifreyi kopyalayıp uygulamadaki 'Yapıştır' butonuna basarak")
    print(f"  tanımlanan süreyi ({type_label}) anında başlatabilir.")
    print("  Bu şifre yalnızca bu cihaza ve bu süreye özeldir, kopyalanamaz.\n")

if __name__ == "__main__":
    main()
