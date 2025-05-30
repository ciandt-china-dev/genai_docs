#!/bin/bash

# GitHub Pages部署脚本
# Deploy script for GitHub Pages

echo "🚀 Deploying to GitHub Pages..."

# 确保在正确的分支上
git checkout main 2>/dev/null || git checkout master 2>/dev/null

# 添加所有更改
git add .

# 提交更改
echo "📝 Committing changes..."
git commit -m "Update documentation - $(date '+%Y-%m-%d %H:%M:%S')"

# 推送到远程仓库
echo "📤 Pushing to remote repository..."
git push origin main 2>/dev/null || git push origin master 2>/dev/null

echo "✅ Deployment completed!"
echo "🌐 Your site will be available at: https://ciandt-china-dev.github.io/genai_docs/"
echo "⏰ It may take a few minutes for changes to appear online." 