# dotfiles

自分用の開発環境を再現するための dotfiles です。  
public リポジトリとして公開しています。

- Shell: **bash**
- Editor:
  - **AstroNvim (Neovim)** … 普段使い
  - **Vim** … 競技プログラミング用（軽量）
- Git 設定を含みます

---

## ⚠️ 注意

### Git の user 情報を含んでいます

このリポジトリには、以下の Git ユーザー情報が含まれています。

```ini
[user]
    name = akTARDIGRADE13
    email = 56926258+akTARDIGRADE13@users.noreply.github.com
````

* GitHub の **noreply メールアドレス**を使用しています

このリポジトリを fork / clone して使用する場合は、
必要に応じて `name` / `email` を変更または削除してください。

---

## ディレクトリ構成

```
dotfiles/
├── bash/
│   └── bashrc          # ~/.bashrc
├── git/
│   └── gitconfig       # ~/.gitconfig
├── vim/
│   └── vimrc           # ~/.vimrc（競プロ用）
├── nvim/
│   └── astro/          # ~/.config/nvim（AstroNvim）
├── install.sh
└── README.md
```

各設定ファイルは **シンボリックリンク**によって `$HOME` 以下に配置されます。

---

## インストール方法

```bash
git clone git@github.com:akTARDIGRADE13/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

* 既存の設定ファイルがある場合は、自動的にバックアップされます
* `$HOME` 以下に symlink が作成されます

---

## Neovim（AstroNvim）

### AstroNvim の要件（公式より）

#### 必須

* **Neovim v0.10 以上**（nightly は非対応）
* **True Color 対応ターミナル**
* **クリップボード連携用ツール**

  * 例：

    * `xclip` / `xsel`（Linux）
    * `wl-clipboard`（Wayland）
    * `pbcopy` / `pbpaste`（macOS）

#### 任意（推奨）

* **Nerd Fonts**
  アイコン表示のため

* **Tree-sitter CLI**
  Tree-sitter の `auto_install` を使う場合のみ必要

#### AstroNvim 連携ツール（任意）

| ツール       | 用途          |
| --------- | ----------- |
| `ripgrep` | ファイル全文検索    |
| `lazygit` | Git UI      |
| `node`    | 多くの LSP で必要 |
| `python`  | REPL・補助ツール  |
| `bottom`  | プロセスビューア    |
| `gdu`     | ディスク使用量表示   |

---

### AstroNvim の要件チェック

以下のコマンドで確認できます。(これだと不十分そう)

```bash
nvim --version
rg --version
node --version
```

---

## バックアップについて

`install.sh` 実行時、既存ファイルは以下に退避されます。

```
dotfiles/.backup/<timestamp>/
```

---

## ライセンス

特に定めていません。
内容の参照は自由ですが、利用は自己責任でお願いします。

