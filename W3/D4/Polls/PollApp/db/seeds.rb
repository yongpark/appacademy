# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
  user1 = User.create(:user_name => "CJ")
  user2 = User.create(:user_name => "Flarnie")

Response.destroy_all
  response1 = Response.create(:answer_choice_id => 1, :respondent_id => 1)
  response2 = Response.create(:answer_choice_id => 1, :respondent_id => 2)


Question.destroy_all
  question1 = Question.create(:question => "Hello", :polls_id => 1)
  question2 = Question.create(:question => "Hello world", :polls_id => 2)

Poll.destroy_all
  poll1 = Poll.create(:title => "Hello",  :author_id => 1)
  poll2 = Poll.create(:title => "Hello world", :author_id => 2)

AnswerChoice.destroy_all
  answer_choice1 = AnswerChoice.create(:answer => "Yes", :question_id => 1)
  answer_choice2 = AnswerChoice.create(:answer => "No", :question_id => 12)
