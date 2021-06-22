#!/bin/bash

LAST_RELEASE="dunfell-2021.03"
CHANGELOG="changelog.txt"

repos=(mion meta-mion meta-mion-bsp meta-mion-backports meta-mion-sde mion-docs)

[ -f ${CHANGELOG} ] && rm ${CHANGELOG}

for r in "${repos[@]}"; do
    [ ! -d "$r" ] && git clone "git@github.com:NetworkGradeLinux/${r}.git"
    
    (
        printf "> %s\n" "$r"
        cd "$r" && git pull > /dev/null 2>&1

        printf "*** %s ***\n\n" "$r" >> ../${CHANGELOG}

        if git rev-parse ${LAST_RELEASE} >/dev/null 2>&1; then
            git log ${LAST_RELEASE}..HEAD --pretty=format:"%h - %d %s (%cr) %an" >> ../${CHANGELOG}
        else
            git log --pretty=format:"%h - %d %s (%cr) %an" >> ../${CHANGELOG}
        fi

        printf "\n\n" >> ../${CHANGELOG}
    )
done
