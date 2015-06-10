class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :shortenedurl_id
      t.integer :vistor_id

      t.timestamps
    end
  end
end
