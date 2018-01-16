#!/bin/sh

CONVERT=`which convert`
SRCFILE='ic_launcher.png'
AFTEREFFECT='ic_round.png'

if [ ! -f ${SRCFILE} ]; then
	echo ERROR: missing ${SRCFILE}
	exit 1
fi

[ ! -d drawable-mdpi ] && mkdir drawable-mdpi
[ ! -d drawable-hdpi ] && mkdir drawable-hdpi
[ ! -d drawable-xhdpi ] && mkdir drawable-xhdpi
[ ! -d drawable-xxhdpi ] && mkdir drawable-xxhdpi
[ ! -d drawable-xxxhdpi ] && mkdir drawable-xxxhdpi

convert -size 1024x1024 xc:none -fill white -draw 'roundRectangle 0,0 1024,1024 0,0' ${SRCFILE} -compose SrcIn -composite ${AFTEREFFECT}

${CONVERT} ${AFTEREFFECT} -units PixelsPerInch -density 72 -resize 48x48 drawable-mdpi/${SRCFILE}
${CONVERT} ${AFTEREFFECT} -units PixelsPerInch -density 72 -resize 72x72 drawable-hdpi/${SRCFILE}
${CONVERT} ${AFTEREFFECT} -units PixelsPerInch -density 72 -resize 96x96 drawable-xhdpi/${SRCFILE}
${CONVERT} ${AFTEREFFECT} -units PixelsPerInch -density 72 -resize 144x144 drawable-xxhdpi/${SRCFILE}
${CONVERT} ${AFTEREFFECT} -units PixelsPerInch -density 72 -resize 192x192 drawable-xxxhdpi/${SRCFILE}

rm ${AFTEREFFECT}
