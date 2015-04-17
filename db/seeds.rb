10.times do |num|
  User.create!(username: "user_#{num}", password: "password")
end

Sub.create!(title: "Dogs", description: "About Dogs", moderator_id: 1)
Sub.create!(title: "Apple", description: "About Apple Products", moderator_id: 2)
Sub.create!(title: "Fun", description: "Just for fun", moderator_id: 1)
Sub.create!(title: "AppAcademy", description: "How to code", moderator_id: 8)

Post.create!(title: "dogs are cool", sub_id: 1, content: "I love them!", author_id: 3)
Post.create!(title: "dogs are stupid", sub_id: 1, content: "I hate them!", author_id: 10)
Post.create!(title: "here is a cool dog", sub_id: 1, url: "http://google.com", author_id: 9)
Post.create!(title: "new iPod", sub_id: 2, url: "http://apple.com", author_id: 8)
Post.create!(title: "fun things to do", sub_id: 3, content: "hiking, biking, more!", author_id: 7)
Post.create!(title: "home page", sub_id: 4, url: "http://appacademy.io", author_id: 5)

PostSub.create!(post_id: 1, sub_id: 1)
PostSub.create!(post_id: 1, sub_id: 2)
PostSub.create!(post_id: 1, sub_id: 3)
PostSub.create!(post_id: 2, sub_id: 1)
PostSub.create!(post_id: 3, sub_id: 1)
PostSub.create!(post_id: 4, sub_id: 2)
PostSub.create!(post_id: 5, sub_id: 3)
PostSub.create!(post_id: 6, sub_id: 4)
