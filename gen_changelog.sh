#!/bin/sh
set -e

LAST_RELEASE="dunfell-2021.03"
CHANGELOG="changelog.txt"

PRETTY_FORMAT="%h -%d %s (%cr) %an"

[ "$1" = "-r" ] && PRETTY_FORMAT="- %h %s"

repos="
    mion
    meta-mion
    meta-mion-backports
    meta-mion-bsp
    meta-mion-sde
    mion-docs
    mion-testing
"

[ -f ${CHANGELOG} ] && rm ${CHANGELOG}

for r in ${repos}; do
    [ ! -d "$r" ] && git clone "git@github.com:NetworkGradeLinux/${r}.git"
    
    (
        printf "> %s\\n" "$r"
        cd "$r" && git pull > /dev/null 2>&1

        printf "*** %s ***\\n\\n" "$r" >> ../${CHANGELOG}

        if git rev-parse ${LAST_RELEASE} >/dev/null 2>&1; then
            git log ${LAST_RELEASE}..HEAD --pretty=format:"${PRETTY_FORMAT}" >> ../${CHANGELOG}
        else
            git log --pretty=format:"${PRETTY_FORMAT}" >> ../${CHANGELOG}
        fi

        printf "\\n\\n" >> ../${CHANGELOG}
    )
done
