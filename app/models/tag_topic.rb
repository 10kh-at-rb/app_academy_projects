class TagTopic < ActiveRecord::Base
  TAGS = ["Sports", "Entertainment", "Tech", "World",
          "USA", "Politics", "Health", "Arts",
          "Odd News", "Science", "Business"]

  validates_inclusion_of :topic, in: TAGS
  validates :topic, presence: true
  validates :topic, uniqueness: true

  has_many( :taggings,
            class_name: "Tagging",
            foreign_key: :tag_topic_id,
            primary_key: :id)

  has_many( :urls,
            through: :taggings,
            source: :url)
end
