#!/usr/bin/env bash
# Packt das Ressourcenpaket als ZIP nach dist/ und gibt den SHA-1 für server.properties aus.
set -euo pipefail

cd "$(dirname "$0")/.."
out="dist/boomer-pack.zip"

mkdir -p dist
rm -f "$out"
zip -rq "$out" pack.mcmeta assets $( [ -f pack.png ] && echo pack.png ) -x '*.gitkeep' -x '*.DS_Store'

echo "Gebaut: $out"
echo "SHA-1:  $(shasum -a 1 "$out" | cut -d' ' -f1)"
