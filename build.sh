#! /bin/bash
cd $(dirname 0)
git submodule init
git submodule update
export PATH="$PATH:$PWD/submodules/flutter/bin"
./submodules/flutter/bin/flutter build web --web-renderer canvaskit --csp --pwa-strategy=none --dart-define=FLUTTER_WEB_CANVASKIT_URL=./canvaskit/ --wasm
rm -rf build/firefox
cp -r build/web_wasm build/firefox
rm build/firefox/manifest.json
mv build/firefox/manifest_firefox.json build/firefox/manifest.json
echo 'All done.'
echo "Chromium: $PWD/build/web_wasm"
echo "Firefox: $PWD/build/firefox"
