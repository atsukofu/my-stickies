# README

## My Stickes
<img width="1042" alt="スクリーンショット 2020-08-23 11 26 38" src="https://user-images.githubusercontent.com/62829792/90969446-d0f48500-e533-11ea-9538-b1cf47abd610.png">
This tool enable you to manage your tasks like "kanban method".<br>
You can check and change situation of your tasks wherever you are if only you access this "My Stickies"!<br>
このアプリは「カンバン方式」でタスクを管理できるツールです。<br>
このアプリにアクセスするだけで、手元に「ToDo」、「Doing」、「Done」の3つの「カンバン」を作成することができ、タスクの状況を確認することができます。<br>

## Description
This tool is based on "Trello".<br>
This tool is simpler than it but if you want to manage only your task's contents and situations, this tool will help you manage tasks easier.<br>
You can manage your multiple tasks per project. <br>
You can check tasks written on some sticy notes calles "Stickies".<br>
When you want to add a new task, you only create new "Stickies" on the board and can serve the task's name, content, situation.<br>
このアプリは「Trello」を元にして作成いたしました。<br>
Trelloはタスクの振り分けや詳細を記入しておく機能などたくさんの便利な機能がありますが、「My Stickes」はもっとシンプルな仕様です。<br>
特に高度な機能が要らないということであれば、このアプリを使っていただければ、タスクの名前と内容、そしてタスクの状況をまるで付箋に書いてホワイトボードに貼っていくかのようにシンプルに管理することができます。<br>
新たにタスクを作りたい場合はプロジェクトごとに新たなタスクを作成することができます。タスク名、内容、状況をデータベースに保存しておく事ができます。

## Usage
$ git clone https://github.com/atsukofu/my-stickies.git<br>
$ cd hoge<br>
$ bundle install<br>
$ rails db:create<br>
$ rails db:migrate<br>
$ rails s<br>
👉 http://localhost:3000
上記コマンドでダウンロードし、ローカルサーバーで起動してください。

If you access on internet Web site, please access later URL.<br>
You can use this tool when you create an account.(Please sign up.)<br>
Web上でアクセスされる場合は下記URLにアクセスしてください。<br>
アカウントを作成していただくと、アプリを使うことができます。<br>
👉 https://my-stickies.herokuapp.com/

## Test account
Please use later test account to use this application for test.
試しにアプリを使用してみる際には、下記のテストアカウントを使用してください！
- mail address: aaa@test.com
- password: test0123

## Commitment
It has a simple UI　and you can use it by easier oparation.<br>
When you want to change a situation of task, you only move "Stickies" to another board by drag and drop and the situation  of task is updated.<br>
Also, because I'd like to understand how session works, I made the feature of making account and doing Login/Logout unless using gem "devise".<br> 
このアプリのこだわりの点は、シンプルな見た目と配色、また操作方法もシンプルに簡単にしたことです。<br>
作成したタスクの状況が変わった時(例えばTodoからDoingに変わった時）は、対象タスクの付箋をドラッグアンドドロップすれば、タスクの状況を変更することができます。<br>
タスクをボードからボードへ移動させるとajax通信でtasksテーブルのsituationカラムの内容を更新することができます。
また、今回のアプリ制作においてセッションの仕組みを理解するため、<br>
ユーザー登録によく使用されるgem 「devise」を使用せずに、ユーザー登録機能とログイン・ログアウト機能を実装いたしました。<br>
テストコード （モデル単体テスト　rspecを使用）を記述したこともこだわりポイントです。

## Technology Used
- Ruby On Rails
- Ruby
- HTML
- Sass
- jQuery UI
- MySQL
ドラッグアンドドロップ については
jQueryUIを使用して実装いたしました。

## Future Plans
I want to add the function of deleting by drag and drop, editing user account and project information, making group.
今後さらにアプリを改善するのであれあば、ドラッグアンドドロップを使ってタスクを削除する機能、<br>
ユーザー情報の編集機能、プロジェクトの編集機能、グループ作成機能を搭載すると、もっと便利に使えるのではないかと考えています。<br>

## DB design
### users table
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
|email|string|null: false, unique: true|
|password_digest|string|null: false|

### Association
- has many projects

### projects table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|null: false, foreign_ley: true|

### Association
- belongs_to user
- has_many tasks

### tasks table
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|text||
|status|integer|null: false|
|project_id|integer|null: false, foreign_ley: true|

### Association
- belongs_to project
