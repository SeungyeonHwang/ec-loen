
# 🔖 アプリケーションの概要

## **LOEN - 韓国コスメ専門ECサイト**

>このアプリケーションはコスパの良い韓国コスメが若い女性に流行っている状況を認識して主に若い女性をターゲットした、各種オンラインストアと連携して実が高い韓国製品を出前で注文できるサービスです。Amazon,Qoo10などのECサイトをイメージして作りました。



> 下記のリンクを参照してください。🙇‍♂️  
> Herokuのdynoがスリープして起動速度が遅い場合があります。(20-30秒)  

- **ページリンク** : https://fierce-harbor-93132.herokuapp.com/
- **管理者ページ** : https://fierce-harbor-93132.herokuapp.com/admin
  - 管理者ID：admin@example.com
  - PASSWORD : password

# ✨アプリケーションの機能一覧

- **サイト管理者機能(Active_Admin)**
  - 商品投稿CRUD
  - 記事投稿CRUD
  - 検索条件絞り込む(ActiveAdmin_filter : ransack)
  - その他全体的のサイト管理
  - BatchAction
    - 商品オープン、クローズ機能
    - 返金
  - 注文状況確認  
- **ログイン & ログアウト**
  - 認証機能 : Devise  
- **マイページ機能**
  - 注文状況の確認
  - 会員情報の変更
  - 注文経歴  
- **商品購入**
  - カート機能
  - 決済機能
  - 注文状況の変更
- **商品絞り込み機能**
  - 星評価（1~5）順
  - 価格順
  - メーカー
  - 売れ筋順
- **商品一覧**
  - 星評価（1~5）作成機能
  - コメント作成機能
    - 作成 
    - 修正
    - 削除
    - 照会
  - 星評価機能
- **記事一覧機能**

# 💻 アプリケーション内で使用している技術一覧

- フレームワーク : `Ruby on Rails(5.2.4)`
- 使用している言語等 : `Ruby(2.7.2)`, `JavaScript(+Jquery)`, `Ajax`, `Bootstrap`, `CSS`, `HTML`
- インフラ : Heroku
- データベース : Postgresql
- 開発ツール : `GitHub`, SourceTree
- 画像ストレージ : `AWS-S3`

# 🔍 データベースER図

![loen_Data](./app/assets/images/loen_erd.png)
