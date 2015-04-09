class DatabaseCleanUp < ActiveRecord::Migration
  def change
    rename_column :responses, :responder_id, :respondent_id
    rename_column :users, :username, :name

  end
end
