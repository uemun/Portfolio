User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)
             
users = User.order(:created_at).take
50.times do
  time = Faker::Number.between(to: 24)
  users.each { |user| user.microposts.create!(time: time) }
end