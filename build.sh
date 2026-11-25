#!/bin/bash
# 原本 ~/Desktop/claude_data/sancha_patio_layout/index.html → src/ へ複製 → staticrypt で暗号化して index.html を生成
set -e
cd "$(dirname "$0")"
cp ~/Desktop/claude_data/sancha_patio_layout/index.html src/index.html
PW="${SANCHA_PW:-sancha-2026}"
npx -y staticrypt src/index.html -d . -p "$PW" --short --remember 30 \
  -t ~/Sites/_templates/staticrypt_password_template_mono.html \
  --template-title "三茶パティオ 設営図" --template-instructions "パスワードを入力してください" \
  --template-button "閲覧する" --template-placeholder "パスワード" --template-error "パスワードが違います" \
  --template-toggle-show "パスワード表示" --template-toggle-hide "パスワード非表示" --template-remember "このブラウザで30日間記憶する"
touch .nojekyll
echo "built index.html ($(wc -c < index.html) bytes)"
