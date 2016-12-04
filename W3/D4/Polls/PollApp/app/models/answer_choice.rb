# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  answer      :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer          not null
#

class AnswerChoice < ActiveRecord::Base
  has_many :responses,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :Response

  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Question
end
