#!/bin/sh

set -eux

WORKING_DIR=$(cd "$(dirname "$0")/.."; pwd)
cd "${WORKING_DIR}"
pwd

SRC_DIR=src
REVIEW_DIR=review

for src in "${SRC_DIR}"/*
do
  dst=${REVIEW_DIR}/$(basename "${src}" .md).re
  echo "${src} > ${dst}"
  md2review --render-enable-cmd "${src}" > "${dst}"

  # substitusions to display line-numbers for codes
  sed -i '' -e 's/^\/\/emlist\[\]\[javascript\]{/\/\/emlistnum[][javascript]{/' "${dst}"
  sed -i '' -e 's/^\/\/emlist\[\]\[json\]{/\/\/emlistnum[][json]{/' "${dst}"
  sed -i '' -e 's/^\/\/emlist\[\]\[objc\]{/\/\/emlistnum[][objc]{/' "${dst}"
  sed -i '' -e 's/^\/\/emlist\[\]\[cpp\]{/\/\/emlistnum[][cpp]{/' "${dst}"

  # substitusions to scale images
  sed -i '' -E 's/^\/\/image\[([^]]+)\]\[([^:]+):([^]]+)\]{/\/\/image[\1][\3][scale=\2]{/' "${dst}"

done
