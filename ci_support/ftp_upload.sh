#!/usr/bin/env bash

set -e

FTP_HOST='oplab9.parqtec.unicamp.br'
LOCALPATH=$HOME/miniconda/conda-bld/linux-ppc64le
REMOTEPATH='/ppc64el/power-ai'

# Upload .tar.bz2 file from LOCALPATH to REMOTEPATH
lftp -f "
set dns:order "inet"
set xfer:use-temp-file yes
set xfer:temp-file-name *.tmp
open ftp://$FTP_HOST
user $FTP_USER $FTP_PASSWORD
mirror -R --continue --reverse --no-empty-dirs --no-perms -i \.tar.bz2$ $LOCALPATH $REMOTEPATH
bye
"

rm -f LOCALPATH/*.tar.bz2
