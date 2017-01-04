# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base

  has_many :authored_polls,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :Poll

  has_many :responses,
  primary_key: :id,
  foreign_key: :respondent_id,
  class_name: :Response



end
