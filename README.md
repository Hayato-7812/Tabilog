# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version  3.2.0

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## 環境構築
1. リポジトリのclone 
```
git clone https://github.com/Hayato-7812/Tabilog.git
```

#### プロジェクトの開始

1. プロジェクトを VSCode で開く
2. 拡張機能 `Dev Containers` をインストールする
3. 左下の緑のボタンをクリックしてメニューから `Reopen in Container` を選択する

#### セットアップ

##### ライブラリのインストール

コンテナ内で以下のコマンドを実行する

```bash
yarn install
bundle install
```

##### M1 Mac

M1 Mac を使用している場合は`bundle install`の前に以下を実行する

```bash
bundle config force_ruby_platform true
```

##### データベースのセットアップ

```
rails db:create
rails db:migrate
rails db:seed
```

#### ログイン

`http://localhost:3000/login`を開いて  
ユーザー名`testuser`、パスワード`password`でログインできる

### ローカルサーバー

```
bin/dev
```
