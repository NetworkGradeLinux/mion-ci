#!/bin/sh
set -e

TAG="dunfell-YYYY.DD"
TAG_TEXT="tag.txt"

repos="
    mion
    meta-mion
    meta-mion-backports
    meta-mion-bsp
    meta-mion-sde
    mion-docs
    mion-testing
"

usage() { echo "Usage: $0 blah " 1>&2; exit 1; }

update_repos() {
    printf "[ mion-ci - %s ]\\n" "$(git rev-parse --short HEAD)"
    for r in ${repos}; do
        [ ! -d "$r" ] && git clone "git@github.com:NetworkGradeLinux/${r}.git"
        (
            cd "$r" && git pull > /dev/null 2>&1
            printf "PULLING %s - %s\\n" "$r" "$(git rev-parse --short HEAD)"
        )
    done
}
    
create_tags(){
    printf "> TAGGING %s - %s\\n" "$r" "$(git rev-parse --short HEAD)"
    git tag -a $TAG -F $TAG_TEXT
    for r in ${repos}; do
        (
            cd "$r"
            printf "> TAGGING %s - %s\\n" "$r" "$(git rev-parse --short HEAD)"
            git tag -a $TAG -F ../$TAG_TEXT
        )
    done
}

delete_tags(){
    printf "> DELETING %s - %s\\n" "$r" "$TAG"
    git tag -d $TAG
    for r in ${repos}; do
        (
            cd "$r"
            printf "> DELETING %s - %s\\n" "$r" "$TAG"
            git tag -d $TAG
        )
    done
}

push_tags(){
    printf "> PUSHING %s - %s\\n" "$r" "$TAG"
    git push origin $TAG
    for r in ${repos}; do
        (
            cd "$r"
            printf "> PUSHING %s - %s\\n" "$r" "$TAG"
            git push origin $TAG
        )
    done
}

while getopts "utdp" o; do
    case "${o}" in
        u) update_repos && exit ;;
        t) create_tags && exit ;;
        d) delete_tags && exit ;;
        p) push_tags && exit ;;
        *) usage
    esac
done
