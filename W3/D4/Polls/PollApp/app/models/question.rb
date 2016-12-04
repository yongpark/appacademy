# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  polls_id   :integer          not null
#

class Question < ActiveRecord::Base
  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :polls_id,
    class_name: :Poll
end
