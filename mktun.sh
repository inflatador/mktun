
#!/usr/bin/env bash
# mktun.sh, a simple script to make an SSH tunnel
LOCALPORT="$1"
REMOTEIP="$2"
REMOTEPORT="$3"
REMOTEHOST="$4"

set -euo pipefail

if [[ $# -eq 0 ]] ; then
    printf "%s\n" "usage: mktun LOCALPORT REMOTEIP REMOTEPORT REMOTEHOST"
    exit 1
fi
printf "%s\n" "Creating a tunnel on local port ${1}"
ssh -Cfo ExitOnForwardFailure=yes -NL ${LOCALPORT}:${REMOTEIP}:${REMOTEPORT} ${USER}@${REMOTEHOST}
