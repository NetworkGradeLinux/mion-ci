#!/bin/bash
set -e
set -x

function error { echo "$1" && exit 1; }

VERSION="v0.9"
GIT_BRANCH="dunfell"
GH_SERVER="git@github.com:APS-Networks"
GIT_CLONE="git clone --branch ${GIT_BRANCH}"

[ -d "mion" ] && error "mion/ exists - delete and re-run"

${GIT_CLONE} --recursive "${GH_SERVER}/mion.git"
${GIT_CLONE} "${GH_SERVER}/meta-mion.git" "mion/meta-mion"
${GIT_CLONE} "${GH_SERVER}/meta-mion-stordis.git" "mion/meta-mion-stordis"

tar --exclude=".*" -cJf "mion_${VERSION}.tar.xz" "mion/"

rm -rf "mion"
