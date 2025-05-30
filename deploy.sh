#!/bin/bash

# 技術文書デプロイスクリプト

echo "技術文書をデプロイしています..."

git checkout main 2>/dev/null || git checkout master 2>/dev/null
git add .
git commit -m "技術文書更新 - $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main 2>/dev/null || git push origin master 2>/dev/null

echo "デプロイ完了" 