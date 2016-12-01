class User < ActiveRecord::Base
  validates :email, :name, presence: true, uniqueness: true

  has_many :shortened_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl

  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl


  has_many :visited,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Visit

  has_many :visited_urls,
  Proc.new { distinct },
  through: :visited,
  source: :shortened_url

end
