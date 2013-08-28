namespace :db do
  desc "Create first administrators"
  task :admin => :environment do
    admin = User.create!(name: "Kendall McCarthy",
                 username: "kendallmccar",
                 email: "kendallmccar@gmail.com",
                 password: "Foobar1",
                 password_confirmation: "Foobar1")
    admin.make_admin
  end
end
