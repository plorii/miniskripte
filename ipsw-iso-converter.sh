#!/bin/zsh

echo "Pfad zur base datei (z.B. /idk/macOS_Sonoma.ipsw):"
read IPSW_PATH
echo "Ganzer Endpfad (z.B. /idk/macOS_Sonoma.iso):"
read ISO_OUT

TMP_DIR=$(mktemp -d)
CDR_PATH="${ISO_OUT%.*}.cdr"

unzip -p "$IPSW_PATH" "*.dmg" > "$TMP_DIR/system.dmg"

hdiutil create -o "$TMP_DIR/vmac" -size 16000m -volname "VM_Install" -layout SPUD -fs HFS+J
hdiutil attach "$TMP_DIR/vmac.dmg" -noverify -mountpoint /Volumes/VM_Install
hdiutil attach "$TMP_DIR/system.dmg" -noverify -mountpoint /Volumes/System_Data

cp -R /Volumes/System_Data/* /Volumes/VM_Install/

hdiutil detach /Volumes/VM_Install
hdiutil detach /Volumes/System_Data
hdiutil convert "$TMP_DIR/vmac.dmg" -format UDTO -o "$CDR_PATH"

mv "$CDR_PATH" "$ISO_OUT"
rm -rf "$TMP_DIR"

echo "Fertig: $ISO_OUT"
