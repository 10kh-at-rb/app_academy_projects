class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :email, message: "User has that contact already" }

  belongs_to :owner,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id

  has_many :contact_shares

  has_many :shared_users,
    through: :contact_shares,
    source: :contact

end
