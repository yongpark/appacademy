# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#

class Poll < ActiveRecord::Base

    belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

    has_many :questions,
    primary_key: :id,
    foreign_key: :polls_id,
    class_name: :Question

end
