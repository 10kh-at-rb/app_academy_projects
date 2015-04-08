class ShortenedUrl < ActiveRecord::Base
  validates :short_url, uniqueness: true
  validates :submitter_id, presence: true
  validates :short_url, presence: true
  validates :long_url, presence: true

  belongs_to(:submitter,
            class_name: "User",
            foreign_key: :submitter_id,
            primary_key: :id)

  has_many( :visits,
            class_name: "Visit",
            foreign_key: :shortenedurl_id,
            primary_key: :id)

  has_many( :visitors,
            through: :visits,
            source: :visitor)

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

  def num_clicks
    self.visits.select(:visitor_id).count
  end

  def num_uniques
    self.visits.select(:visitor_id).distinct.count
  end

  def num_recent_uniques
    self.visits.select(:visitor_id).distinct
    .where({created_at: (10.minutes.ago..Time.now)}).count
  end
end
