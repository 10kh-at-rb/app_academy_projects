class Grouping < ActiveRecord::Base
  validates :group_id, :contact_id, presence: true

  belongs_to :group
  belongs_to :contact

end
