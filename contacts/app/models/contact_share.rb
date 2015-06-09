class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :contact_id, message: "User can't have two shares for same contact." }

  belongs_to :contact
  belongs_to :user

end
