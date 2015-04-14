COLORS = %w( orange brown white black grey )
SEX = %w( m f t )
10.times do |num|
  Cat.create!(
    name: "cat_#{num}",
    color: COLORS.sample,
    birth_date: num.years.ago,
    sex: SEX.sample,
    description: "This is the #{num}th cat."
  )
end
