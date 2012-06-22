namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 username: "exampleuser",
                 email: "example@railstutorial.org",
                 password: "Foobar1",
                 password_confirmation: "Foobar1",
                 dob: 1975)
    admin.make_admin
    User.create!(name: "Example User",
                 username: "exampleuser",
                 email: "example@railstutorial.org",
                 password: "Foobar1",
                 password_confirmation: "Foobar1",
                 dob: 1975)
    99.times do |n|
      name = Faker::Name.name
      username  = "#{Faker::Internet.user_name}#{n}"
      email = "example-#{n+1}@railstutorial.org"
      password  = "Password1"
      dob = 1975
      User.create!(username: username,
                   name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   dob: dob)
    end
  end
end