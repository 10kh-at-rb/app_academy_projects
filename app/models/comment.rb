class Comment < ActiveRecord::Base
  validates :commentable_type, :commentable_id, :commenter_id, presence: true

  belongs_to :commentable, polymorphic: true


end
