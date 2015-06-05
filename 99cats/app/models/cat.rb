class Cat < ActiveRecord::Base
  belongs_to :owner,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id

  COLORS = %w( orange brown white black grey )
  validates :birth_date, :color, :name, :sex, presence: true
  validates_inclusion_of :sex, in: %w( m f t )
  validates_inclusion_of :color, in: COLORS

  has_many :cat_rental_requests, dependent: :destroy

  def age
    (Time.now.utc.to_date.year - self.birth_date.year)
  end


end
