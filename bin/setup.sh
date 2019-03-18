#!/bin/sh

set -eux

if ! review-init -v > /dev/null 2>&1
then
  echo 'Install RE:View: https://github.com/kmuto/review'
  exit 1
fi

ROOT=$(cd "$(dirname "$0")/.."; pwd)
echo "${ROOT}"

cd "${ROOT}"

review-init review
cd review

mv images/* ../images/
rmdir ./images
ln -s ../images ./images

cp -f ../catalog.yml.template ./catalog.yml
