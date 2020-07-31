#!/bin/bash
REPONAME=ken-aur.db.tar.gz
for f in /home/build/repo/"$1"*; do
    [ -e "$f" ] && rm "$f" && repo-remove /home/build/repo/$REPONAME "$1" \
    && echo "Removed old package $f"
    break
done

for f in "$1"*.pkg.tar.*; do
    [ -e "$f" ] && cp "$f" /home/build/repo/ && repo-add /home/build/repo/$REPONAME /home/build/repo/"$f" \
    && echo "Added new package $f"
    break
done
