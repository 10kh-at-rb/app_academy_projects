class ChangeUsers < ActiveRecord::Migration
  def change
    remove_columns(:users, :name, :email)
    add_column(:users, :username, :string)

    add_index(:users, :username, unique: true)

  end
end
