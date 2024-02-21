# 旅行計画アプリ 「Tabilog」

このリポジトリは、Ruby on Railsを使用したバックエンドとHTML/CSSを使用したフロントエンドで構築された旅行計画アプリです。Google Maps APIを使用して地図機能を実装し、UIデザインはFigmaで作成されました。

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
`http://localhost:3000/login`を開いてwelcomeページが表示されれば成功！

### ログイン（ToDo）

## 制作者

- [ao-pooh](https://github.com/ao-pooh)
- [Hayato-7812](https://github.com/Hayato-7812)
- [m-sy17](https://github.com/m-sy17)
- [Masaya7707](https://github.com/Masaya7707)


## サポート

質問やバグ報告がある場合は、issueを作成してください。

