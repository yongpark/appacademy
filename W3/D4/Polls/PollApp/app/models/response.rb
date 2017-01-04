# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  respondent_id    :integer          not null
#

class Response < ActiveRecord::Base
    # belongs_to :question,
    #   primary_key: :id,
    #   foreign_key: :question_id,
    #   class_name: :Question

    belongs_to :respondent,
      primary_key: :id,
      foreign_key: :respondent_id,
      class_name: :User

    belongs_to :answer_choice,
      primary_key: :id,
      foreign_key: :answer_choice_id,
      class_name: :AnswerChoice


end
