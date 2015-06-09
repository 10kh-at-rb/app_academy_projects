class User < ActiveRecord::Base
  has_many :subs,
    class_name: "Sub",
    foreign_key: :moderator_id,
    primary_key: :id,
    dependent: :destroy
  has_many :posts,
    class_name: "Post",
    foreign_key: :author_id,
    primary_key: :id,
    dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  attr_reader :password

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(username, password)
    @user = User.find_by(username: username)
    return nil if @user.nil?
    @user.is_password?(password) ? @user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    save!
    session_token
  end


end
