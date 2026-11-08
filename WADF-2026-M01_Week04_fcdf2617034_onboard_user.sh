#!/usr/bin/env bash
set -euo pipefail
if [ "$EUID" -ne 0 ]; then echo "Error: Run as root." >&2; exit 1; fi
if [ "$#" -ne 2 ]; then echo "Usage: $0 <username> <groupname>" >&2; exit 1; fi
USERNAME="$1"; GROUPNAME="$2"
if getent group "$GROUPNAME" >/dev/null 2>&1; then echo "Error: Group exists." >&2; exit 2; fi
if getent passwd "$USERNAME" >/dev/null 2>&1; then echo "Error: User exists." >&2; exit 3; fi
groupadd "$GROUPNAME"
useradd -m -s /bin/bash -g "$GROUPNAME" "$USERNAME"
echo "${USERNAME}:TempPass2026!" | chpasswd
USERDIR="/srv/wadf-userdirs/${USERNAME}"
mkdir -p "$USERDIR" && chown "${USERNAME}:${GROUPNAME}" "$USERDIR" && chmod 1770 "$USERDIR"
echo "Onboarding Successful!"; exit 0


