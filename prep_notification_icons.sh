#!/bin/sh

CONVERT=`which convert`
SRCFILE="$1"
DESTFILE="$2"

if [ "${SRCFILE}" = "" -o "${DESTFILE}" = "" ]; then
  echo "USAGE: $0 {src.filename} {dest.filename}"
  exit 0
fi

if [ ! -f ${SRCFILE} ]; then
	echo ERROR: missing ${SRCFILE}
	exit 1
fi

declare -a drawableFolders=("drawable-ldpi" "drawable-mdpi" "drawable-hdpi" "drawable-xhdpi" "drawable-xxhdpi")
declare -a drawableSizes=("18x18" "24x24" "36x36" "48x48" "72x72")

for folderIdx in "${!drawableFolders[@]}"; do
  drawableFolder="${drawableFolders[$folderIdx]}"
  [ ! -d "${drawableFolder}" ] && mkdir "${drawableFolder}"
  ${CONVERT} ${SRCFILE} -units PixelsPerInch -density 72 -resize "${drawableSizes[$folderIdx]}" ${drawableFolder}/${DESTFILE}
done

# convert -size 1024x1024 xc:none -fill white -draw 'roundRectangle 0,0 1024,1024 200,200' ${SRCFILE} -compose SrcIn -composite ${AFTEREFFECT}
# rm ${AFTEREFFECT}
