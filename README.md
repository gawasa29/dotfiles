# dotfiles

Mac にインストールしているアプリ・ツールの一覧を `Brewfile` で管理しています。

## はじめに(Homebrew を入れる)

Homebrew が入っていない場合は、先にインストールします。

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 新しい Mac にセットアップする

```bash
git clone git@github.com:gawasa29/dotfiles.git ~/work/dotfiles
cd ~/work/dotfiles
brew bundle
```

`Brewfile` に書かれているものがまとめてインストールされます。

## Brewfile を更新する(アプリを追加・削除したあと)

今の Mac に入っているものを `Brewfile` に書き出して、GitHub に push します。

```bash
cd ~/work/dotfiles
brew bundle dump --force --describe
git add Brewfile
git commit -m "update Brewfile"
git push
```

## よく使うコマンド

| やりたいこと | コマンド |
| --- | --- |
| Brewfile の内容をインストールする | `brew bundle` |
| 今の環境を Brewfile に書き出す | `brew bundle dump --force --describe` |
| インストール済みのパッケージを最新にする | `brew update && brew upgrade` |
| Brewfile に無いものを確認する | `brew bundle cleanup` |
| Brewfile に無いものを削除する | `brew bundle cleanup --force` |

※ すべて `~/work/dotfiles` ディレクトリで実行してください。
