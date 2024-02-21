# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version  3.2.0

* System dependencies

* Configuration


## 環境構築
1. リポジトリのclone 
```
git clone https://github.com/Hayato-7812/Tabilog.git
```

#### プロジェクトの開始

1. プロジェクトを VSCode で開く
2. 拡張機能 `Dev Containers` をインストールする
3. 左下の緑のボタンをクリックしてメニューから `Reopen in Container` を選択する(初めての起動は[こちら](https://zenn.dev/hkdord/articles/remote-containers)を参考にした)

#### セットアップ

##### ライブラリのインストール

コンテナ内で以下のコマンドを実行する

```bash
bundle install
```

##### データベースのセットアップ

```
rails db:create
rails db:migrate
rails db:seed
```

#### ログイン


### ローカルサーバー

```
bin/dev
```
