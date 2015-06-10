# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "joe") #1
User.create!(name: "job")
User.create!(name: "jane")
User.create!(name: "liann")
User.create!(name: "jeric")
User.create!(name: "eric")
User.create!(name: "jan")
User.create!(name: "lia")
User.create!(name: "jablow")
User.create!(name: "asdf")
User.create!(name: "jean")
User.create!(name: "l") #12

Poll.create!(title: "Food", author_id: 1)
Poll.create!(title: "Computers", author_id: 2)
Poll.create!(title: "Booze", author_id: 3)

Question.create!(poll_id: 1, text: "fav food")
Question.create!(poll_id: 1, text: "least fav food")
Question.create!(poll_id: 2, text: "fav OS")

AnswerChoice.create!(question_id: 1, text: "Pizza")
AnswerChoice.create!(question_id: 1, text: "Salad")
AnswerChoice.create!(question_id: 1, text: "hot dogs")
AnswerChoice.create!(question_id: 2, text: "brussel sprouts")
AnswerChoice.create!(question_id: 2, text: "spinach")
AnswerChoice.create!(question_id: 2, text: "chicken feet")
AnswerChoice.create!(question_id: 3, text: "os x")
AnswerChoice.create!(question_id: 3, text: "windows")
AnswerChoice.create!(question_id: 3, text: "linux")

Response.create!(respondent_id: 12, answer_choice_id: 1)
Response.create!(respondent_id: 12, answer_choice_id: 5)
Response.create!(respondent_id: 12, answer_choice_id: 7)
Response.create!(respondent_id: 5, answer_choice_id: 1)
Response.create!(respondent_id: 6, answer_choice_id: 2)
Response.create!(respondent_id: 7, answer_choice_id: 1)
Response.create!(respondent_id: 8, answer_choice_id: 2)
Response.create!(respondent_id: 5, answer_choice_id: 4)
Response.create!(respondent_id: 6, answer_choice_id: 5)
Response.create!(respondent_id: 7, answer_choice_id: 4)
Response.create!(respondent_id: 8, answer_choice_id: 5)
Response.create!(respondent_id: 8, answer_choice_id: 9)
