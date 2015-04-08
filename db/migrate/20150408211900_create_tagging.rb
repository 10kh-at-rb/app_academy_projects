class CreateTagging < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :url_id
      t.integer :tag_topic_id

      t.timestamps
    end
  end
end
