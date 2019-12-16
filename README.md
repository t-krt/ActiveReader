## Active Reader
アプリは[こちら](https://www.active-reader.xyz/)から確認できます。  
アクセス後、「早速始める」→「かんたんログイン」をクリックいただくと、テストユーザーとして各種機能をお試しいただけます。

### 概要
以下の機能を通じて、『読書を行動につなげる』ためのサポートを行うアプリです。
- 蔵書管理：書籍を登録し、「読書中」・「読了」・「あとで読む」の状態ごとに管理できます。
- 読書メモ：読書の目的・ポイント等を、自分の言葉でまとめることができます。
- タスク管理：書籍から学んだことをもとに、行動したい内容をタスクとして登録できます。

### 使用技術
- Ruby 2.6.5
- Rails 5.2.3
- MySQL 5.7
- Haml
- SCSS
- Docker
- RSpec（単体テスト・統合テスト）
- AWS
  - ECS/ECR
  - EC2/ALB
  - RDS for MySQL
  - S3
  - Route 53
  - Amazon Certificate Manager
  - AWS Systems Manager
  - VPC
- CircleCI

### AWSアーキテクチャ
![AWSアーキテクチャ](https://gyazo.com/ec3d9b271f3e5408324f4786f9740c52/raw)

### 実装した機能
- ユーザー管理機能（gem: deviseを利用）
- 書籍検索機能（楽天ブックスAPI（gem: rakuten_web_service）を利用）
- レビュー投稿機能
- タスク管理機能
- お気に入り（いいね）機能
- その他利用Gem・ライブラリ・サービスなど
  - kaminari（ページネーション）
  - rubocop（静的コード解析）
  - bullet（N+1問題対策）
  - jQuery Raty（5段階でのレビュー評価）
  - ransack（投稿済みレビューの検索機能）
  - Bootstrap4
  - Font Awesome

### 今後実装したい点
- 書籍管理機能の拡充
  - 書籍のタグ付け機能の実装
- SNS機能の拡充
  - ソーシャルログイン機能の実装(omniauthの利用を想定)
  - コメント機能の実装
