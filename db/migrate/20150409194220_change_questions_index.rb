class ChangeQuestionsIndex < ActiveRecord::Migration
  def change
    remove_index :questions, :poll_id
    add_index :questions, :poll_id
  end
end
