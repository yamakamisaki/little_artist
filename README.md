## アプリケーション名
「Little Artist！」

## アプリケーション概要
「子どもの作品」を写真でシェアし、web上に子どもの作品を保管できるアプリケーション

## URL
https://little-artist.herokuapp.com/
## テスト用アカウント
・　Basic認証パスワード：laappname<br>
・　Basic認証ID：08642<br>
・　メールアドレス：test@co.jp<br>
・　パスワード：123456a<br>

## 利用方法
<br>

#### 作品を投稿する
---
1.トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う<br>
2.ヘッダーに出てくるユーザー名をクリックし、「投稿する」ボタンを押す<br>
3.フォームを入力し、「送信する」ボタンを押す<br>
<br>

#### 自分の投稿を一覧で確認する
---
1.ヘッダーのユーザー名をクリックし、「マイページ」ボタンを押す<br>
2.下にスクロールすると、自分の投稿が表示される
<br>

#### 【マイページの補足】
----
1.ヘッダー直下の「検索」について<br>
フォームに「検索したいワード」を入力後、「このページから探す」を選択することで、自分の投稿内のみでワード検索することができる<br>

2.プロフィール内の 「お気に入りの作品 ▼」について<br>
 「お気に入りの作品 ▼」ボタンをクリックすることで、お気に入り登録した作品を一覧で見ることができる<br><br>

## アプリケーションを作成した背景
保育の現場で保護者の方と話をする中で「家庭でも発達に即した遊び（制作）をしたいが思いつかない」「５歳児だと５年分の作品になるので、保管場所に悩むことがある」という課題を抱えていることが判明した。<br><br>
課題を分析した結果、「発達に即した遊びが思いつかない」ことに関しては仕事や子育てで忙しく、時間が取れないことが要因ではないかと仮定し、時間がなくても欲しい情報にすぐアクセスできるアプリケーションを作成することが解決の１つになるのではないかと仮説を立てた。<br>
「保管場所に悩む」ことに関しては成長の記録を「写真として」web上に保存することで管理しやすくなるのではないかと仮説を立てた。<br><br>
そこで「子どもの作品」をメインとし、web上に子どもの作品を保管できるアプリケーションを開発することにした。<br><br><br>

## 要件定義書
<a href="https://docs.google.com/spreadsheets/d/1xWT7EXczxErw-GaC6EjuY97mknriTalp7hBm-IpIyHE/edit#gid=982722306">「Little Artist！」 要件定義書(Googleスプレッドシート)</a>
<br>

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/c1ffc87fcd5f25eb48571842dd889664.png)](https://gyazo.com/c1ffc87fcd5f25eb48571842dd889664)
<br><br>

## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/b87340862afecc48877e148a95c017c5.png)](https://gyazo.com/b87340862afecc48877e148a95c017c5)
<br><br>

## 実装した機能についての画像やGIT
・トップページ（一覧表示機能）
[![Image from Gyazo](https://i.gyazo.com/2b1793ab426dd2bcf0bd438892e4124e.png)](https://gyazo.com/2b1793ab426dd2bcf0bd438892e4124e)
[![Image from Gyazo](https://i.gyazo.com/fd9e3cb3d5c4624fe2c03fff7d3026e2.gif)](https://gyazo.com/fd9e3cb3d5c4624fe2c03fff7d3026e2)
・アプリ紹介ページ抜粋
[![Image from Gyazo](https://i.gyazo.com/c334ad0ba1e34525a6b9475308d91564.gif)](https://gyazo.com/c334ad0ba1e34525a6b9475308d91564)
・マイページ機能
[![Image from Gyazo](https://i.gyazo.com/5cb08ad9c0b25ce0cf9f17a5a15b18a0.png)](https://gyazo.com/5cb08ad9c0b25ce0cf9f17a5a15b18a0)
[![Image from Gyazo](https://i.gyazo.com/d1f9cbaa41f2038feae5e8ea40e92811.png)](https://gyazo.com/d1f9cbaa41f2038feae5e8ea40e92811)
・作品詳細機能
[![Image from Gyazo](https://i.gyazo.com/a25bf4443d50204fe09ff3b9940f9f46.gif)](https://gyazo.com/a25bf4443d50204fe09ff3b9940f9f46)
・コメント例
[![Image from Gyazo](https://i.gyazo.com/61729795e3df6e2bd17c6102d73fbfcf.png)](https://gyazo.com/61729795e3df6e2bd17c6102d73fbfcf)
<br><br>

## 実装予定の機能
・お気に入り機能の非同期化
・画像投稿時に画像プレビューを表示させる機能
<br><br>

## 開発環境
・フロントエンド（HTML、CSS、JavaScript、jQuery）<br>
・バックエンド、テスト（Ruby）<br>
・データベース（mySQL）<br>
・テキストエディタ（Visual Studio Code）<br>
・タスク管理（GitHub）<br><br>

## ローカルでの動作方法
以下のコマンドを順に実行。<br>
% git clone https://github.com/yamakamisaki/little_artist.git<br>
% cd little_artist<br>
% bundle install<br>
% yarn install<br><br>

## 工夫したポイント
### ・ビューのデザイン
子どもの作品をメインとしているため全体的に丸みを帯びた、柔らかいイメージを意識しました。
（パステル調の色味・枠などの丸角・デザインで使用した画像も柔らかさを意識）

------
<br>

### ・直感的にユーザーが使用しやすいアクション
リンク先に遷移する場所は色を変えたり、動きを出すことで、ユーザーが直感的にアクションしやすいよう意識しました。

----
<br>

### ・ユーザーの利便性向上機能
ユーザーの利便性を向上させるため、以下のような機能を実装しました。
#### ○検索機能（投稿すべてまたは、マイページでは自分を含めた、特定のユーザーの投稿のみからの検索も可能）

#### ○お気に入り機能
#### ○コメント機能
#### ○マイページ機能
#### ○レスポンシブ対応
#### ○日本語エラーメッセージ対応　

-------

<br><br>
