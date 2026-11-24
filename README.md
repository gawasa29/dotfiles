# dotfiles

新しい Mac に入れるものと、その入れ方をまとめたリポジトリです。
どれも、それぞれの公式サイトが案内している方法で入れます。

## 全体の流れ

新しい Mac では、上から順に進めます。

| # | やること | 入れ方 |
| --- | --- | --- |
| 1 | [Karabiner-Elements](#1-karabiner-elements) | 公式サイトからダウンロード |
| 2 | [Xcode](#2-xcode) | App Store |
| 3 | [Google Chrome](#3-google-chrome) | 公式サイトからダウンロード |
| 4 | [1Password](#4-1password) | 公式サイトからダウンロード |
| 5 | [Claude Desktop](#5-claude-desktop) | 公式サイトからダウンロード。CLI は公式ページの方法 |
| 6 | [Homebrew](#6-homebrew) | 公式サイトのコマンド |
| 7 | [このリポジトリと Brewfile](#7-このリポジトリと-brewfile) | `brew bundle` |
| 8 | [入れたあとの設定](#8-入れたあとの設定) | コマンドとアプリの設定 |
| 9 | [Node.js](#9-nodejs) | 公式サイトからダウンロード |
| 10 | [Muse](#10-muse) | 公式サイトからダウンロード |
| 11 | [op-stash](#11-op-stash) | `npm install -g` |
| 12 | [pnpm](#12-pnpm) | `npm install -g --allow-scripts=pnpm` |
| 13 | [Obsidian](#13-obsidian) | 公式サイトからダウンロード |
| 14 | [Asana](#14-asana) | 公式サイトからダウンロード |

## このリポジトリのファイル

| ファイル | 中身 |
| --- | --- |
| `Brewfile` | Homebrew で入れるもの。公式が Homebrew での入れ方を案内しているものだけを書く（例外は cocoapods） |

## 新しい Mac のセットアップ

### 1. Karabiner-Elements

日本語入力に必要なので、最初に入れます。

- [ダウンロード（公式）](https://karabiner-elements.pqrs.org/)

入れたあと、画面の案内に従って次の 4 つを許可します。

- バックグラウンドでの実行
- アクセシビリティ
- 入力監視
- ドライバ機能拡張

最初にキーボードの種類を聞かれたら、ANSI を選びます。

続けて、左 option で英数、右 option でかなに切り替わるようにします。Karabiner-Elements の設定画面で「Simple Modifications」を開き、「For all devices」を選んだまま「Add item」で次の 2 つを足します。

| 左（変える前のキー） | 右（変えたあとのキー） |
| --- | --- |
| `left_option` | ABC キー（英数キー） |
| `right_option` | あいうキー（かなキー） |

### 2. Xcode

ダウンロードに時間がかかるので、早めに始めておきます。

- [App Store](https://apps.apple.com/jp/app/xcode/id497799835)

### 3. Google Chrome

- [ダウンロード（公式）](https://www.google.com/chrome/)

### 4. 1Password

ほかのアプリのサインインに使うので、早めに入れます。

- [ダウンロード（公式）](https://1password.com/downloads/mac)

### 5. Claude Desktop

Claude のデスクトップアプリです。Claude Code は、このアプリの「Code」タブでも使えます。

- [ダウンロード（公式）](https://claude.com/download)

**Claude Code の CLI**

ターミナルからも `claude` コマンドで Claude Code を使えるように、CLI も入れておきます。入れ方は変わることがあるので、公式ページで推奨されている方法で入れます。

- [インストール方法（公式）](https://code.claude.com/docs/en/setup)

### 6. Homebrew

- [インストール方法（公式）](https://brew.sh/ja/)

インストールの最後に表示される「Next steps」のコマンドも実行して、`brew` コマンドを使えるようにします。

### 7. このリポジトリと Brewfile

```bash
git clone https://github.com/gawasa29/dotfiles.git ~/work/dotfiles
cd ~/work/dotfiles
brew trust btwld/fvm
brew trust mobai-app/tap
brew bundle
```

`brew trust` は tap を信頼済みにするコマンドです（`btwld/fvm` は fvm、`mobai-app/tap` は simslim の tap）。これを先に実行しないと、`brew bundle` が `Refusing to load formula btwld/fvm/fvm from untrusted tap btwld/fvm.` のように止まります。

`Brewfile` に書いてある次のものが入ります。

| 名前 | 用途 | 公式の案内 |
| --- | --- | --- |
| gh | GitHub の操作 | [リンク](https://github.com/cli/cli/blob/trunk/docs/install_macos.md) |
| fvm | Flutter のバージョン管理 | [リンク](https://fvm.app/documentation/getting-started/installation) |
| cocoapods | iOS アプリのビルド（Flutter で使う） | [リンク](https://formulae.brew.sh/formula/cocoapods)（公式は `gem install` を案内。Homebrew のほうが入れやすいので例外として Brewfile に書く） |
| simslim | iOS シミュレータの裏で動く不要なプロセスを止めて軽くする | [リンク](https://github.com/mobai-app/simslim) |
| 1password-cli | ターミナルから 1Password を使う | [リンク](https://developer.1password.com/docs/cli/get-started/) |
| zed | エディタ | [リンク](https://zed.dev/docs/installation) |

### 8. 入れたあとの設定

**GitHub にログインし、Git の SSH 鍵を作る**

```bash
gh auth login --git-protocol ssh
```

- 画面の質問に答えると、ブラウザで GitHub にログインします。
- SSH 鍵（`~/.ssh/id_ed25519`）がまだ無いので、新しく作って GitHub に登録するか聞かれます。作るを選びます。
- これで、`git clone`・`git push` などが SSH でつながるようになります（[gh 公式の説明](https://cli.github.com/manual/gh_auth_login)）。

このリポジトリは手順 7 で HTTPS で clone したので、SSH でつなぐように変えておきます。

```bash
cd ~/work/dotfiles
git remote set-url origin git@github.com:gawasa29/dotfiles.git
```

つながるか確かめます。`Hi gawasa29!` と出れば大丈夫です。

```bash
ssh -T git@github.com
```

**Git の名前とメールを設定する**

コミットに記録される名前とメールです。メールは GitHub の noreply アドレスにして、本物のアドレスを公開しないようにします（[GitHub 公式の説明](https://docs.github.com/ja/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-email-preferences/setting-your-commit-email-address)）。

```bash
git config --global user.name "gawasa"
git config --global user.email "61944230+gawasa29@users.noreply.github.com"
```

**1Password CLI をアプリと連携する**

1Password アプリの Settings > Developer で「Integrate with 1Password CLI」をオンにします。日本語表示では名前が違うことがあります。

**Flutter を使えるようにする（fvm）**

まず、[2. Xcode](#2-xcode) で入れた Xcode の初期設定をします（[Flutter 公式の手順](https://docs.flutter.dev/platform-integration/ios/setup)）。Xcode のダウンロードとインストールが終わってから実行します。

1 行目でコマンドラインツールをこの Xcode に向けて初回起動の準備をし、2 行目でライセンスに同意し、3 行目で iOS のプラットフォームとシミュレータをダウンロードします。

```bash
sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'
sudo xcodebuild -license
xcodebuild -downloadPlatform iOS
```

次に、fvm で Flutter の stable を入れ、ふだん使う Flutter にします（[fvm 公式の手順](https://fvm.app/documentation/guides/global-configuration)）。

```bash
fvm global stable
```

`flutter` コマンドを使えるように、`~/fvm/default/bin` を PATH に足します。

```bash
echo 'export PATH="$HOME/fvm/default/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

最後に、足りないものがないか確かめます。

```bash
flutter doctor
```

プロジェクトで使う Flutter のバージョンは、プロジェクトの `.fvmrc` に書いてあります。プロジェクトのフォルダで次を実行すると、そのバージョンが入ります。

```bash
fvm install
```

### 9. Node.js

- [ダウンロード（公式）](https://nodejs.org/ja/download)

### 10. Muse

Meta の AI エージェントのデスクトップアプリです。App Store ではなく、Meta の公式サイトからダウンロードします。

- [ダウンロード（公式）](https://ai.meta.com/muse/download/)

### 11. op-stash

1Password CLI で読んだ秘密を、しばらくメモリに覚えておくツールです。続けて読むたびに 1Password の確認が出るのを防ぎます。Node.js 22 以上と 1Password CLI が必要です。

```bash
npm install -g @davidwells/op-stash
```

- [README（公式）](https://github.com/DavidWells/configorama/tree/master/packages/op-stash#readme)

### 12. pnpm

npm の代わりに使うパッケージマネージャーです。DeepSeek Harness（dsh）の Web UI でプラグインを入れるときに使われます。

```bash
npm install -g --allow-scripts=pnpm pnpm
```

`--allow-scripts=pnpm` を付けます。付けないと pnpm のインストール時のスクリプトが止められ（`install scripts blocked` の警告が出ます）、`pnpm` が仮のファイルのまま残ります。ターミナルからは動きますが、dsh のようにほかのアプリから起動すると `ENOEXEC` で失敗します。

- [インストール方法（公式）](https://pnpm.io/installation)

### 13. Obsidian

メモアプリです。

- [ダウンロード（公式）](https://obsidian.md/download)

### 14. Asana

タスクとプロジェクトの管理アプリです。

- [ダウンロード（公式）](https://asana.com/download)

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

## Mac を初期化するとき

macOS を入れ直さずに、買ったときの状態に戻せます。

- [Mac を消去して工場出荷時の初期設定にリセットする（Apple 公式）](https://support.apple.com/ja-jp/102664)

そのあとは、上の [新しい Mac のセットアップ](#新しい-mac-のセットアップ) を 1 から進めます。
