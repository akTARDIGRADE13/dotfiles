#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
BACKUP_DIR="$DOTFILES_DIR/.backup/$(date +%Y%m%d_%H%M%S)"

mkdir -p "$BACKUP_DIR"

log() { printf '[dotfiles] %s\n' "$*"; }

backup_if_needed() {
  local dst="$1"
  if [ -L "$dst" ]; then
    # symlinkなら、正しいリンク先かだけ確認して、違えばバックアップ
    local cur
    cur="$(readlink "$dst" || true)"
    if [ -n "$cur" ]; then
      log "existing symlink: $dst -> $cur"
    fi
    return 0
  fi
  if [ -e "$dst" ]; then
    mkdir -p "$BACKUP_DIR$(dirname "$dst")"
    mv "$dst" "$BACKUP_DIR$dst"
    log "backup: $dst -> $BACKUP_DIR$dst"
  fi
}

link() {
  local src_rel="$1"
  local dst_rel="$2"

  local src="$DOTFILES_DIR/$src_rel"
  local dst="$HOME/$dst_rel"

  if [ ! -e "$src" ]; then
    log "ERROR: source not found: $src"
    return 1
  fi

  mkdir -p "$(dirname "$dst")"

  # すでに同じ symlink なら何もしない
  if [ -L "$dst" ]; then
    local cur
    cur="$(readlink "$dst" || true)"
    if [ "$cur" = "$src" ]; then
      log "ok: $dst already linked"
      return 0
    fi
  fi

  backup_if_needed "$dst"

  # 既存の symlink で違う先を向いているなら消して張り直す
  if [ -L "$dst" ]; then
    rm -f "$dst"
  fi

  ln -s "$src" "$dst"
  log "link: $dst -> $src"
}

log "DOTFILES_DIR=$DOTFILES_DIR"
log "BACKUP_DIR=$BACKUP_DIR"

# ---- managed links ----
link "bash/bashrc" ".bashrc"
link "git/gitconfig" ".gitconfig"
link "vim/vimrc" ".vimrc"
link "nvim/astro" ".config/nvim"

log "done"
