class Visit < ActiveRecord::Base
  validates :shortenedurl_id, presence: true
  validates :visitor_id, presence: true

  belongs_to(:visitor,
            class_name: "User",
            foreign_key: :visitor_id,
            primary_key: :id)

  belongs_to(:visited_url,
            class_name: "ShortenedUrl",
            foreign_key: :shortenedurl_id,
            primary_key: :id)

  def self.record_visit!(user, shortened_url)
    Visit.new(visitor_id: user.id,
              shortenedurl_id: shortened_url.id).save!
  end
end
