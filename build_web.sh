#!/usr/bin/env bash
set -e

echo "=== [1/5] Configuring Git Safe Directory ==="
git config --global --add safe.directory "*" || true

echo "=== [2/5] Setting up Flutter SDK ==="
if [ ! -x "_flutter/bin/flutter" ]; then
  echo "Flutter not found or incomplete. Setting up Flutter stable..."
  rm -rf _flutter
  if ! git clone https://github.com/flutter/flutter.git --depth 1 -b stable _flutter; then
    echo "git clone failed, downloading from Google CDN..."
    curl -s -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.47.6-stable.tar.xz -o flutter.tar.xz
    tar -xf flutter.tar.xz
    rm -f flutter.tar.xz
    mv flutter _flutter
  fi
else
  echo "Flutter SDK already cached, reusing existing installation."
fi

export PATH="$PWD/_flutter/bin:$PATH"
git config --global --add safe.directory "$PWD/_flutter" || true

echo "=== [3/5] Checking Flutter Version ==="
flutter --version
flutter config --no-analytics

echo "=== [4/5] Building Web App (Release) ==="
flutter pub get
flutter build web --release

echo "=== [5/5] Finalizing Assets and Manifest ==="
mkdir -p build/web/data
[ -f "update_manifest.json" ] && cp -f update_manifest.json build/web/ || true
[ -f "version.json" ] && cp -f version.json build/web/ || true
[ -d "assets/data" ] && cp -rf assets/data/* build/web/data/ 2>/dev/null || true

echo "=== Build finished successfully! ==="
