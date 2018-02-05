meetups = [
  { name: "Deep Star Diving", description: "Let's dive into the cosmos.", location: "Stars", creator: "doctordolittle456" },
  { name: "Circus O Space", description: "Forget Elephants and tight rope walking. Come to Mars123.v1 Sector to watch Aliens drink water!", location: "Mars123.v1", creator: "superdood" },
  { name: "Rocket Carts", description: "Go-carts in space", location: "Venus", creator: "gratefuldeadfan" }
]

meetups.each do |attributes|
  Meetup.create(attributes)
end


Meetup.first.users << User.create({ provider: "github", uid: "456", username: "doctordolittle456", email: "doctordolittle456@github.com", avatar_url: "https://static.pexels.com/photos/53594/blue-clouds-day-fluffy-53594.jpeg" })
Meetup.first.users << User.create({ provider: "github", uid: "100", username: "spacetraveler100", email: "spacetraveler100@github.com", avatar_url: "http://99giggle.com/wp-content/uploads/2017/07/Funny-When-Teacher-Asks-You-To-Read-Out-Loud-14763.jpg" })
Meetup.first.users << User.create({ provider: "github", uid: "123", username: "applegenius123", email: "applegenius123@github.com", avatar_url: "https://s7d1.scene7.com/is/image/PETCO/dog-category-090617-369w-269h-hero-cutout-d?fmt=png-alpha" })

Meetup.second.users << User.create({ provider: "github", uid: "002", username: "superdood", email: "superdood@github.com", avatar_url: "https://cdn.houseplans.com/product/o2d2ui14afb1sov3cnslpummre/w1024.jpg?v=15" })
Meetup.second.users << User.create({ provider: "github", uid: "789", username: "mjordan789", email: "mjordan789@github.com", avatar_url: "http://i0.kym-cdn.com/photos/images/newsfeed/001/217/729/f9a.jpg" })

Meetup.third.users << User.create({ provider: "github", uid: "555", username: "gratefuldeadfan", email: "gratefuldeadfan@github.com", avatar_url: "https://fthmb.tqn.com/8cdFIfAhwNAdNAJelEebxEhrmTI=/735x0/success-56a9fd1f3df78cf772abee09.jpg" })


# Issues:
#   * When adding a new meetup successfully, redirect to show page of that meetup
