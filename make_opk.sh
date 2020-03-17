#!/bin/sh

OPK_NAME=ohboy.opk

echo ${OPK_NAME}

# create default.gcw0.desktop
cat > default.gcw0.desktop <<EOF
[Desktop Entry]
Name=OhBoy
Type=Application
Exec=ohboy.gcw0 %f
Icon=ohboy
Comment=GB/GBC Emulator
Terminal=false
Categories=emulators;
MimeType=application/x-gameboy-rom;application/x-gbc-rom;application/zip;application/gzip;
EOF

# create opk
FLIST="ohboy.gcw0"
FLIST="${FLIST} default.gcw0.desktop"
FLIST="${FLIST} ohboy.png"
FLIST="${FLIST} etc"

rm -f ${OPK_NAME}
mksquashfs ${FLIST} ${OPK_NAME} -all-root -no-xattrs -noappend -no-exports

cat default.gcw0.desktop
rm -f default.gcw0.desktop
