class Group < ActiveRecord::Base
  validates :title, :user_id, presence: true

  belongs_to :user
  has_many :groupings

end
