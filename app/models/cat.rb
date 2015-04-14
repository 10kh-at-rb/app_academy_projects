class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, presence: true
  validates_inclusion_of :sex, in: %w( m f t )
  validates_inclusion_of :color, in: %w( orange brown white black grey )

  def age
    (Time.now.utc.to_date.year - self.birth_date.year)
  end


end
