class ShortenedUrl < ActiveRecord::Base
  validates :short_url, uniqueness: true
  validates :submitter_id, presence: true
  validates :short_url, presence: true
  validates :long_url, presence: true

  belongs_to(:submitter,
            class_name: "User",
            foreign_key: :submitter_id,
            primary_key: :id)


  def self.random_code
    secure = SecureRandom.urlsafe_base64
    until !self.exists?(:short_url => secure)
      secure = SecureRandom.urlsafe_base64
    end
    secure
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.new(submitter_id: user.id,
                     long_url: long_url,
                     short_url: random_code).save!
  end
end
