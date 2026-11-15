#!/bin/bash
# ~/.config/karabiner を、このリポジトリの karabiner フォルダへのシンボリックリンクにする。
# Karabiner-Elements の公式ドキュメントのとおり、karabiner.json ではなくフォルダごとリンクする。
# https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path/
set -euo pipefail

src="$(cd "$(dirname "$0")" && pwd)/karabiner"
dest="$HOME/.config/karabiner"

if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
  echo "すでにリンク済みです: $dest -> $src"
  exit 0
fi

mkdir -p "$HOME/.config"
if [ -e "$dest" ] || [ -L "$dest" ]; then
  backup="$dest.backup-$(date +%Y%m%d%H%M%S)"
  mv "$dest" "$backup"
  echo "元の設定を退避しました: $backup"
fi

ln -s "$src" "$dest"
echo "リンクしました: $dest -> $src"

# リンクしたあと、設定の変更を検知させるために一度だけ再起動する（公式ドキュメントの手順）。
launchctl kickstart -k "gui/$(id -u)/org.pqrs.service.agent.Karabiner-Console-User-Server" 2>/dev/null \
  || echo "Karabiner-Elements が起動していないため、再起動は飛ばしました。"
