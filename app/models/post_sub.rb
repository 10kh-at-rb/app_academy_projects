class PostSub < ActiveRecord::Base
  belongs_to :sub
  belongs_to :post
  validates :sub_id, :post, presence: true

end
