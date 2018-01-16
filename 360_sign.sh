#!/bin/sh
# This script works with the binary from 360-hardening (http://jiagu.360.cn/protection?s=1)
# reference:
# http://bbs.360.cn/forum.php?mod=viewthread&tid=6948018&extra=page%3D1

function showHelp {
  echo "USAGE: ./360_sign.sh {keystore.file} {alias} {keyStorePass} {keyPass} {apk.file}"
  exit 0
}

if [ $# -ne 5 ]; then
  showHelp
fi

DIGEST_ALGORITHM="SHA1"
SIGNATURE_ALGORITHM="SHA1withRSA"

KEYSTORE_FILE="$1"
ALIAS="$2"
STOREPASS="$3"
KEYPASS="$4"
APK_FILE="$5"
JAR_SIGNER=`which jarsigner`

if [ "${JAR_SIGNER}" == "" ]; then
  echo "jarsigner is not installed"
fi

${JAR_SIGNER} -tsa http://timestamp.digicert.com -digestalg ${DIGEST_ALGORITHM} -sigalg ${SIGNATURE_ALGORITHM} -verbose -keystore "${KEYSTORE_FILE}" -storepass "${STOREPASS}" -keypass "${KEYPASS}" ${APK_FILE} ${ALIAS}
