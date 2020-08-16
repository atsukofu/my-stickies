# README

## My Post it
<img width="1325" alt="スクリーンショット 2020-08-16 10 13 45" src="https://user-images.githubusercontent.com/62829792/90324506-a3935e80-dfaa-11ea-9918-d1ac176c39e5.png">
This tool enable you to manage your tasks like "kanban method".<br>
You can check and change situation of your tasks wherever you are if only you access this "My Post it"!

## Description
This tool is based on "Trello".<br>
This tool is simpler than it but if you want to manage only your task's contents and situations, this tool will help you manage tasks easier.<br>
You can manage your multiple tasks per project. <br>
You can check tasks written on some sticy notes called "post-it".<br>
When you want to add a new task, you only create new "post-it" on the board applying the task's situation.<br>

## Usage
$ git clone https://github.com/atsukofu/my-post-it.git<br>
$ cd hoge<br>
$ bundle install<br>
$ rails db:create<br>
$ rails db:migrate<br>
$ rails s<br>
👉 http://localhost:3000

## Commitment
It has a simple UI　and you can use it by easier oparation.<br>
When you want to change a situation of task, you only move "post-it" to another board by drag and drop and the situation  of task is updated.<br>
Also, because I'd like to understand how session works, I made the feature of making account and doing Login/Logout unless using gem "devise".<br> 

## Technology Used
- Ruby On Rails
- Ruby
- HTML
- Sass
- jQuery UI
- MySQL

## Future Plans
I want to add the function of deleting by drag and drop, editing user account and project information, making group.

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
