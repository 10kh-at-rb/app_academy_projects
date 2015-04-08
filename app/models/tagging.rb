class Tagging < ActiveRecord::Base
  validates :tag_topic_id, presence: true
  validates :url_id, presence: true

  belongs_to( :tag_topic,
              class_name: "TagTopic",
              foreign_key: :tag_topic_id,
              primary_key: :id)
  belongs_to( :url,
              class_name: "ShortenedUrl",
              foreign_key: :url_id,
              primary_key: :id)

  def self.record_tag!(short_url, tag_topic)
    Tagging.create!(url_id: short_url.id,
              tag_topic_id: tag_topic.id)
  end

end
