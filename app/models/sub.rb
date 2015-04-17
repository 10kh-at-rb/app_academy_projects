class Sub < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :moderator, class_name: "User"
  validates :title, :description, :moderator_id, presence: true
end
