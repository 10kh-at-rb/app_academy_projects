COLORS = %w( orange brown white black grey )
SEX = %w( m f t )
10.times do |num|
  Cat.create!(
    name: "cat_#{num}",
    color: COLORS.sample,
    birth_date: num.years.ago,
    sex: SEX.sample,
    description: "This is the #{num}th cat.",
    user_id: num
  )
end

CatRentalRequest.create!(cat_id: 1, start_date: 10.days.ago, end_date: 1.day.ago)
CatRentalRequest.create!(cat_id: 1, start_date: 10.days.ago, end_date: 3.day.ago)
CatRentalRequest.create!(cat_id: 4, start_date: 10.days.ago, end_date: 1.day.ago)
CatRentalRequest.create!(cat_id: 8, start_date: 10.days.ago, end_date: 1.day.ago)


10.times do |num|
  User.create!(
    username: "user_#{num}",
    password: "password"
  )
end
