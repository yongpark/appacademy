class User < ApplicationRecord
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 8, allow_nil: true }

  has_many :algorithms

  attr_reader :password

  after_initialize :ensure_session_token

  def self.find_by_credentials(username, pw)
    user = User.find_by(username: username)
    user && user.is_password?(pw) ? user : nil
  end

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end

  def reset_session_token
    self.session_token = generate_session_token
    self.save
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end
  
  private

  def generate_session_token
    SecureRandom.urlsafe_base64
  end


end
