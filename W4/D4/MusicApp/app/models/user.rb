# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  after_initialize :ensure_session_token
  validates :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(128)
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(128)
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def password
    @password
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return if user.nil?
    user.is_password?(password) ? user : nil
  end


  def is_password?(password)
    bc_object = BCrypt::Password.new(password_digest)
    bc_object.is_password?(password)
  end

end
