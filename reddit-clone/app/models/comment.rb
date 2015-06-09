class Comment < ActiveRecord::Base
  has_many :child_comments,
    class_name: "Comment",
    foreign_key: :parent_comment_id,
    primary_key: :id
  belongs_to :parent_comment,
    class_name: "Comment",
    foreign_key: :parent_comment_id,
    primary_key: :id
  belongs_to :post
  belongs_to :author, class_name: "User"
  validates :author_id, :post_id, :content, presence: true

end
