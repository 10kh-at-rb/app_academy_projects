10.times do |num|
  User.create!(username: "user_#{num}", password: "password")
end
