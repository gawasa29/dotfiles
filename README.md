# dotfiles

新しい Mac に入れるものと、その入れ方をまとめたリポジトリです。
どれも、それぞれの公式サイトが案内している方法で入れます。

## 全体の流れ

新しい Mac では、上から順に進めます。

| # | やること | 入れ方 |
| --- | --- | --- |
| 1 | [Karabiner-Elements](#1-karabiner-elements) | 公式サイトからダウンロード |
| 2 | [Google Chrome](#2-google-chrome) | 公式サイトからダウンロード |
| 3 | [1Password](#3-1password) | 公式サイトからダウンロード |
| 4 | [Xcode](#4-xcode) | App Store |
| 5 | [Homebrew](#5-homebrew) | 公式サイトのコマンド |
| 6 | [このリポジトリと Brewfile](#6-このリポジトリと-brewfile) | `brew bundle` |
| 7 | [入れたあとの設定](#7-入れたあとの設定) | コマンドとアプリの設定 |
| 8 | [Claude Code](#8-claude-code) | 公式サイトのコマンド |
| 9 | [Node.js](#9-nodejs) | 公式サイトからダウンロード |

## このリポジトリのファイル

| ファイル | 中身 |
| --- | --- |
| `Brewfile` | Homebrew で入れるもの。公式が Homebrew での入れ方を案内しているものだけを書く |
| `karabiner/karabiner.json` | Karabiner-Elements のキーの設定 |
| `setup-karabiner.sh` | Karabiner-Elements の設定を、このリポジトリのものにするスクリプト |

## 新しい Mac のセットアップ

### 1. Karabiner-Elements

日本語入力に必要なので、最初に入れます。

- [インストール方法（公式）](https://karabiner-elements.pqrs.org/docs/getting-started/installation/)

入れたあと、画面の案内に従って次の 4 つを許可します。

- バックグラウンドでの実行
- アクセシビリティ
- 入力監視
- ドライバ機能拡張

キーの設定は、[7. 入れたあとの設定](#7-入れたあとの設定) で入れます。

### 2. Google Chrome

- [ダウンロード（公式）](https://www.google.com/chrome/)

### 3. 1Password

ほかのアプリのサインインに使うので、早めに入れます。

- [ダウンロード（公式）](https://1password.com/downloads/mac)

### 4. Xcode

ダウンロードに時間がかかるので、早めに始めておきます。

- [App Store](https://apps.apple.com/jp/app/xcode/id497799835)

### 5. Homebrew

- [インストール方法（公式）](https://brew.sh/ja/)

インストールの最後に表示される「Next steps」のコマンドも実行して、`brew` コマンドを使えるようにします。

### 6. このリポジトリと Brewfile

```bash
git clone https://github.com/gawasa29/dotfiles.git ~/work/dotfiles
cd ~/work/dotfiles
brew bundle
```

`Brewfile` に書いてある次のものが入ります。

| 名前 | 用途 | 公式の案内 |
| --- | --- | --- |
| gh | GitHub の操作 | [リンク](https://github.com/cli/cli/blob/trunk/docs/install_macos.md) |
| fvm | Flutter のバージョン管理 | [リンク](https://fvm.app/documentation/getting-started/installation) |
| 1password-cli | ターミナルから 1Password を使う | [リンク](https://developer.1password.com/docs/cli/get-started/) |
| zed | エディタ | [リンク](https://zed.dev/docs/installation) |

### 7. 入れたあとの設定

**GitHub にログインする**

```bash
gh auth login
```

**1Password CLI をアプリと連携する**

1Password アプリの Settings > Developer で「Integrate with 1Password CLI」をオンにします。日本語表示では名前が違うことがあります。

**Karabiner-Elements のキーの設定を入れる**

左 option で英数、右 option でかなに切り替わるようにします。

```bash
cd ~/work/dotfiles
./setup-karabiner.sh
```

- `~/.config/karabiner` が、このリポジトリの `karabiner` フォルダへのシンボリックリンクになります。
- もとの設定は `~/.config/karabiner.backup-日時` に退避されます。
- リンクしたあとは、Karabiner-Elements の画面で設定を変えると、このリポジトリの `karabiner/karabiner.json` が書き換わります。

### 8. Claude Code

- [インストール方法（公式）](https://code.claude.com/docs/en/setup)

### 9. Node.js

- [ダウンロード（公式）](https://nodejs.org/ja/download)

## Brewfile を変えるとき

`Brewfile` は手で編集します。

> [!WARNING]
> `brew bundle dump --force` は使いません。今の Mac に入っているものすべてで `Brewfile` が上書きされます。

よく使うコマンドです。どれも `~/work/dotfiles` で実行します。

| やりたいこと | コマンド |
| --- | --- |
| Brewfile の内容をインストールする | `brew bundle` |
| Brewfile の内容が入っているか確かめる | `brew bundle check` |
| インストール済みのものを最新にする | `brew update && brew upgrade` |
