class ShortenedUrl < ActiveRecord::Base
  include SecureRandom

  validates :short_url, uniqueness: true
  validates :long_url, presence: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User


  def self.random_code
    # new_url = nil
    new_url = SecureRandom.urlsafe_base64
    until ShortenedUrl.exists?(short_url: new_url) == false
      new_url = SecureRandom.urlsafe_base64
    end
    new_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: self.random_code)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor
# Model.select(:field)

  def num_clicks
    Visit.select(:user_id).count
  end

  def num_uniques
    Visit.select(:user_id).distinct.count
  end

  def num_recent_uniques
    Visit.select(:user_id).distinct.where(created_at:(Time.now - 10.minutes)).count
  end


end
