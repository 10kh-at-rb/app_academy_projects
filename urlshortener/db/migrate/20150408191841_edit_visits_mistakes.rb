class EditVisitsMistakes < ActiveRecord::Migration
  def change
    remove_column(:visits, :vistor_id, :integer)
    add_column(:visits, :visitor_id, :integer)
    add_index(:visits, :shortenedurl_id)
  end
end
