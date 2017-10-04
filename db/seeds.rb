# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
User.find_or_create_by(username: 'Luke', email: "test@gmail.com",password_digest:"passowrd")
User.find_or_create_by(username: 'Luke1', email: "test1@gmail.com",password_digest:"passowrd")
User.find_or_create_by(username: 'Luk2', email: "test2@gmail.com",password_digest:"passowrd")
User.find_or_create_by(username: 'Luk3', email: "test3@gmail.com",password_digest:"passowrd")
User.find_or_create_by(username: 'Luk4', email: "test4@gmail.com",password_digest:"passowrd")
