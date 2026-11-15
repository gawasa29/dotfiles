# dotfiles

新しい Mac に入れるものと、その入れ方をまとめています。
どれも、それぞれの公式サイトが案内している方法で入れます。

- 公式が Homebrew での入れ方を案内しているもの → `Brewfile` にまとめて `brew bundle` で入れる
- それ以外 → 下の手順にある公式ページのリンクから入れる

## 新しい Mac のセットアップ

上から順に進めます。

### 1. Karabiner-Elements

日本語入力に必要なので、最初に入れます。

- https://karabiner-elements.pqrs.org/docs/getting-started/installation/

入れたあと、案内に従ってバックグラウンドでの実行、アクセシビリティ、入力監視、ドライバ機能拡張を許可します。
キーの設定は、手順 6 でこのリポジトリを clone したあとに入れます。

### 2. Google Chrome

- https://www.google.com/chrome/

### 3. 1Password

ほかのアプリのサインインに使うので、早めに入れます。

- https://1password.com/downloads/mac

### 4. Xcode

ダウンロードに時間がかかるので、早めに始めておきます。

- https://apps.apple.com/jp/app/xcode/id497799835

### 5. Homebrew

- https://brew.sh/ja/

インストールの最後に表示される「Next steps」のコマンドも実行して、`brew` コマンドを使えるようにします。

### 6. このリポジトリと Brewfile

```bash
git clone https://github.com/gawasa29/dotfiles.git ~/work/dotfiles
cd ~/work/dotfiles
brew bundle
```

`Brewfile` に書いてあるものが入ります。

| 名前 | 用途 | 公式の案内 |
| --- | --- | --- |
| gh | GitHub の操作 | https://github.com/cli/cli/blob/trunk/docs/install_macos.md |
| fvm | Flutter のバージョン管理 | https://fvm.app/documentation/getting-started/installation |
| 1password-cli | ターミナルから 1Password を使う | https://developer.1password.com/docs/cli/get-started/ |
| zed | エディタ | https://zed.dev/docs/installation |

入れたあと、GitHub にログインします。

```bash
gh auth login
```

1Password CLI を使うには、1Password アプリの Settings > Developer で「Integrate with 1Password CLI」をオンにします（日本語表示では名前が違うことがあります）。

Karabiner-Elements の設定（左 option で英数、右 option でかな）を、このリポジトリのものにします。

```bash
./setup-karabiner.sh
```

`~/.config/karabiner` が、このリポジトリの `karabiner` フォルダへのシンボリックリンクになります。もとの設定は `~/.config/karabiner.backup-日時` に退避されます。リンクしたあとは、Karabiner-Elements の画面で設定を変えると、このリポジトリの `karabiner/karabiner.json` が書き換わります。

### 7. Claude Code

- https://code.claude.com/docs/en/setup

### 8. Node.js

- https://nodejs.org/ja/download

## Brewfile を変えるとき

`Brewfile` は手で編集します。
`brew bundle dump --force` を使うと、今の Mac に入っているものすべてで上書きされるので使いません。

| やりたいこと | コマンド |
| --- | --- |
| Brewfile の内容をインストールする | `brew bundle` |
| Brewfile の内容が入っているか確かめる | `brew bundle check` |
| インストール済みのものを最新にする | `brew update && brew upgrade` |

※ すべて `~/work/dotfiles` で実行します。
