#!/bin/sh
# Alle Prüfungen der EduKSX-Suite (projekt.pruefbefehl, Workflow «pruefungen»).
# Vorläufig: Syntax aller Shell-Skripte mit «sh -n», dazu shellcheck, falls installiert.
# Wird mit dem Grundgerüst erweitert (Compose-Prüfung, Probeläufe des Installers).
set -eu
cd "$(dirname "$0")/.."

fehler=0
skripte=$(find . -name '*.sh' -not -path './.git/*' | sort)
for s in $skripte; do
    if ! sh -n "$s"; then
        echo "✗ Syntaxfehler: $s"
        fehler=1
    fi
done
if [ -n "$skripte" ] && command -v shellcheck >/dev/null 2>&1; then
    # shellcheck disable=SC2086
    shellcheck -s sh $skripte || fehler=1
fi
[ "$fehler" -eq 0 ] && echo "✓ Prüfungen bestanden ($(echo "$skripte" | grep -c . || true) Skript(e))"
exit "$fehler"
