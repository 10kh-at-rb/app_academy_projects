class RenameColumnOfCommentId < ActiveRecord::Migration
  def change
    rename_column :comments, :comment_id, :parent_comment_id
  end
end
