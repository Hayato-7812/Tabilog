# 旅行計画アプリ 「Tabilog」
![スクリーンショット 2024-02-19 19 30 33](https://github.com/Hayato-7812/Tabilog/assets/63275973/c59d780f-f384-40b1-92e1-9ac74249bde3)

<img width="50%" alt="image" src="https://github.com/Hayato-7812/Tabilog/assets/63275973/6110ddf2-13a4-4002-af0c-4413310a4f65">


このリポジトリは、明治大学総合数理学部に在籍していたお友達4人によって2024/02/19より始動されたハッカソンプロジェクトのリポジトリです。

## アプリの概要

### 解決したい課題
- インターネット/SNS上に旅行に関する膨大な情報が錯綜している（複数のWebサイト/アプリケーションを行き来して情報を取捨選択するのには手間がかかる）
- それらの情報は全て断片的なものに過ぎず、旅行の一連の工程（交通手段/観光スポットの所要時間/予算etc...）を参考にすることはできない

### 目的
- 旅行計画を楽にやりたい
  - 行きたい場所，やりたいことの情報からすぐに旅程が立てられる 
  - 誰かの旅行計画やその詳細な情報を一度に確認できる

### 方法
- Generative AI を駆使して旅行計画を支援する
- 旅程全体を共有できる機能を実装する
  - Post
  - Share
  - Comment
  - Map

## 構成

- Ruby 3.2.0
- Rails 7.0.8
- APIs:
  - Google Maps API
  - AI
- UIデザイン: Figma


### 言語
<p>
  <img alt="JavaScript" src="https://img.shields.io/badge/-JavaScript-F7DF1E?style=flat-square&logo=JavaScript&logoColor=white" />
  <img alt="Ruby" src="https://img.shields.io/badge/-Ruby-CC342D?style=flat-square&logo=Ruby&logoColor=white" />
</p>

### フレームワーク・その他
<p>
  <img alt="React" src="https://img.shields.io/badge/-React-45b8d8?style=flat-square&logo=react&logoColor=white" />
 　　<img alt="Ruby-on-Rails" src="https://img.shields.io/badge/-Rails-CC0000?style=flat-square&logo=Ruby-on-Rails&logoColor=white" />
  <img alt="Docker" src="https://img.shields.io/badge/-Docker-46a2f1?style=flat-square&logo=docker&logoColor=white" />
</p>

---

## 環境構築

1. リポジトリのクローン

```bash
git clone https://github.com/Hayato-7812/Tabilog.git
```

### プロジェクトの開始

1. プロジェクトをVSCodeで開きます。
2. 拡張機能 `Dev Containers` をインストールします。
3. 左下の緑のボタンをクリックしてメニューから `Reopen in Container` を選択します。初めての起動は[こちら](https://zenn.dev/hkdord/articles/remote-containers)を参考にしてください。

### セットアップ

#### ライブラリのインストール

コンテナ内で以下のコマンドを実行します。

```bash
yarn install
poetry install
bundle install
```

#### データベースのセットアップ

```bash
rails db:create
rails db:migrate
rails db:seed
```

### ローカルサーバー

```bash
bin/dev
```
[http://localhost:3000](http://localhost:3000)を開いてwelcomeページが表示されれば成功！

### ログイン（ToDo）

## 制作者

- [ao-pooh](https://github.com/ao-pooh)
- [Hayato-7812](https://github.com/Hayato-7812)
- [m-sy17](https://github.com/m-sy17)
- [Masaya7707](https://github.com/Masaya7707)


## サポート

質問やバグ報告がある場合は、issueを作成してください。

