#!/bin/bash
set -e
set -x

function error { echo "$1" && exit 1; }

VERSION="0.9" #dunfell
GH_SERVER="git@github.com:APS-Networks"
GIT_CLONE="git clone --branch ${VERSION}"

[ -d "mion" ] && error "mion/ exists - delete and re-run"

${GIT_CLONE} --recursive "${GH_SERVER}/mion.git" "mion_${VERSION}"
${GIT_CLONE} "${GH_SERVER}/meta-mion.git" "mion_${VERSION}/meta-mion"
${GIT_CLONE} "${GH_SERVER}/meta-mion-stordis.git" "mion_${VERSION}/meta-mion-stordis"

tar --exclude=".git*" -czf "mion_${VERSION}.tar.gz" "mion_${VERSION}/"

rm -rf "mion_${VERSION}"
