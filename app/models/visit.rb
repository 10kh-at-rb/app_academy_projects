class Visit < ActiveRecord::Base
  validates :shortenedurl_id, presence: true
  validates :visitor_id, presence: true

  def self.record_visit!(user, shortened_url)
    Visit.new(visitor_id: user.id,
              shortenedurl_id: shortened_url.id).save!
  end
end
