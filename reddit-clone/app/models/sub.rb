class Sub < ActiveRecord::Base
  has_many :posts,
    through: :post_subs,
    source: :post
  has_many :post_subs, dependent: :destroy
  belongs_to :moderator, class_name: "User"
  validates :title, :description, :moderator_id, presence: true
end
