#!/usr/bin/env bash
# Downloads the open-source fonts (SIL Open Font License) used by the game into the app,
# so the finished APK works with no internet. This script NEVER fails the build:
# if a font cannot be downloaded the game simply uses the phone's own fonts.
DEST="app/src/main/assets/fonts"
BASE="https://cdn.jsdelivr.net/npm/@fontsource"
mkdir -p "$DEST"
get() {
  if curl -fsSL --retry 3 --max-time 60 "$BASE/$1@5/files/$2" -o "$DEST/$2.tmp" && [ -s "$DEST/$2.tmp" ]; then
    mv "$DEST/$2.tmp" "$DEST/$2"; echo "ok    $2"
  else
    rm -f "$DEST/$2.tmp"; echo "WARN  could not download $2 (the phone's own font will be used for it)"
  fi
}
for w in 500 600 700; do
  get rajdhani "rajdhani-latin-$w-normal.woff2"
  get barlow-condensed "barlow-condensed-latin-$w-normal.woff2"
done
for w in 400 600 700; do
  get vazirmatn "vazirmatn-latin-$w-normal.woff2"
  get vazirmatn "vazirmatn-arabic-$w-normal.woff2"
done
echo "fonts bundled: $(ls "$DEST"/*.woff2 2>/dev/null | wc -l) of 15"
exit 0
