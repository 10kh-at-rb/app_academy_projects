class Cat < ActiveRecord::Base
  COLORS = %w( orange brown white black grey )
  validates :birth_date, :color, :name, :sex, presence: true
  validates_inclusion_of :sex, in: %w( m f t )
  validates_inclusion_of :color, in: COLORS

  has_many :cat_rental_requests

  def age
    (Time.now.utc.to_date.year - self.birth_date.year)
  end


end
