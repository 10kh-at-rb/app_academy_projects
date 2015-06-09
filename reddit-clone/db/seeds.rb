10.times do |num|
  User.create!(username: "user_#{num}", password: "password")
end

Sub.create!(title: "Dogs", description: "About Dogs", moderator_id: 1)
Sub.create!(title: "Apple", description: "About Apple Products", moderator_id: 2)
Sub.create!(title: "Fun", description: "Just for fun", moderator_id: 1)
Sub.create!(title: "AppAcademy", description: "How to code", moderator_id: 8)

Post.create!(title: "dogs are cool", content: "I love them!", author_id: 3)
Post.create!(title: "dogs are stupid", content: "I hate them!", author_id: 10)
Post.create!(title: "here is a cool dog", url: "http://google.com", author_id: 9)
Post.create!(title: "new iPod", url: "http://apple.com", author_id: 8)
Post.create!(title: "fun things to do", content: "hiking, biking, more!", author_id: 7)
Post.create!(title: "home page", url: "http://appacademy.io", author_id: 5)

PostSub.create!(post_id: 1, sub_id: 1)
PostSub.create!(post_id: 1, sub_id: 2)
PostSub.create!(post_id: 1, sub_id: 3)
PostSub.create!(post_id: 2, sub_id: 1)
PostSub.create!(post_id: 3, sub_id: 1)
PostSub.create!(post_id: 4, sub_id: 2)
PostSub.create!(post_id: 5, sub_id: 3)
PostSub.create!(post_id: 6, sub_id: 4)
