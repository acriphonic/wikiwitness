FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:username) { |n| "person#{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }  
    dob 1975
    password "Foobar1"
    password_confirmation "Foobar1"
  end
  factory :admin do
  	account "admin"
  end
end