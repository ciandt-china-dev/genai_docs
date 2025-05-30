# ネットワークモジュール

## 実装済みネットワーク

- [DetectionNet](detectionnet.md) - オブジェクト検出ネットワーク
- [ClassifierNet](classifiernet.md) - 分類ネットワーク
- [Block](block.md) - 基本構成要素

## モジュール概要

このモジュールは、プロジェクトで使用される様々なニューラルネットワークモデルの実装を提供します。

## ドキュメントリスト

### 🔍 検出ネットワーク
- [DetectionNet](detectionnet.md) - オブジェクト検出ネットワークの実装と設定

### 🏷️ 分類ネットワーク  
- [ClassifierNet](classifiernet.md) - 分類ネットワークのアーキテクチャと使用方法

### 🧱 基本構成要素
- [Block](block.md) - ネットワークの基本モジュールと構成ブロック

## ネットワークの特性

- **モジュール化設計** - 各ネットワークコンポーネントは独立して使用および設定できます
- **効率的推論** - 最適化されたネットワークアーキテクチャ、高速推論をサポート
- **柔軟な設定** - 複数の設定オプションと超パラメータ調整をサポート
- **容易な拡張** - 一般的なインタフェースに基づいて、新しいネットワークレイヤーを追加するのに便利

## 使用ガイド

1. まず [Block](block.md) を読んで基本コンポーネントを理解する
2. タスクの要件に基づいて適切なネットワークを選択する：
   - オブジェクト検出タスク：[DetectionNet](detectionnet.md) を参照
   - 分類タスク：[ClassifierNet](classifiernet.md) を参照
3. 具体的なドキュメントを確認して設定と使用方法を確認 