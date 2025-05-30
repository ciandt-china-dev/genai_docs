# AIプロジェクト技術文書

[![Deploy to GitHub Pages](https://github.com/ciandt-china-dev/genai_docs/workflows/Deploy%20to%20GitHub%20Pages/badge.svg)](https://github.com/ciandt-china-dev/genai_docs/actions)

## 概要

本技術文書は、OCR_Japaneaseプロジェクトに関するAIシステムのアーキテクチャとコード実装についての詳細資料です。

## 📖 文書の閲覧

### オンライン版
**🔗 [https://ciandt-china-dev.github.io/genai_docs/](https://ciandt-china-dev.github.io/genai_docs/)**

### ローカル環境での開発・プレビュー

```bash
# docsifyをインストール
npm i docsify-cli -g

# ローカルサーバーを起動
docsify serve .

# ブラウザで http://localhost:3000 にアクセス
```

## 📁 文書構成

### 主要セクション
- **[プロジェクトアーキテクチャ](docs/project_architecture/)** - システム全体の設計と構成
- **[コード文書](docs/project%20code%20documentation/)** - 実装詳細とAPIリファレンス
  - OCR日本語処理の詳細
  - ニューラルネットワーク実装 (DetectionNet, ClassifierNet)
  - ユーティリティ機能 (Structure, Detection, NMS)

### 技術スタック
- 🚀 [Docsify](https://docsify.js.org/) - ドキュメントサイトジェネレーター
- 📊 [Mermaid](https://mermaid-js.github.io/) - 図表作成
- 🎨 Vue.css テーマ
- 🔍 全文検索機能
- 📱 レスポンシブデザイン

## 🚀 デプロイ

このドキュメントはGitHub Pagesで自動デプロイされます。

- `main`または`master`ブランチへのプッシュで自動的にデプロイが実行されます
- GitHub Actionsによる継続的インテグレーション/デプロイメント (CI/CD)

## 🛠️ 開発

### 文書の編集方法
1. `docs/`ディレクトリ内のMarkdownファイルを編集
2. 変更をコミット・プッシュ
3. 自動的にサイトが更新されます

### 新しいページの追加
1. 新しいMarkdownファイルを作成
2. `_sidebar.md`にナビゲーションを追加
3. 必要に応じて`_navbar.md`も更新

## 📄 ライセンス

このドキュメントプロジェクトはCI&Tによって構築されています。

---

> 💡 **ヒント**: 左側のサイドバーから各セクションにアクセスできます。検索機能も利用可能です。 