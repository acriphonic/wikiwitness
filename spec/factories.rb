FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    username "myhartl"
    email    "michael@example.com"
    dob      1990
    password "foobar87990"
    password_confirmation "foobar87990"
  end
end