class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commenter_id
      t.integer :commentable_id
      t.string :commentable_type
      t.string :text, null: false

      t.timestamps

    end

    add_index(:comments, :commentable_id)
    add_index(:comments, :commenter_id)
  end
end
