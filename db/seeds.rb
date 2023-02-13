# Create a main sample User
User.create!(email: "tolase@simplelist.com",
             password: "foobar",
             password_confirmation: "foobar")

# Create a bunch of additional users.
99.times do |n|
    email       = "example-#{n+1}@simplelist.com"
    password    = "password"
    User.create!(email:                 email,
                 password:              password,
                 password_confirmation: password)
end

# Generate lists for a subset of users.
users = User.order(:created_at).take(6)
50.times do
  description = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.lists.create!(description: description) }
end