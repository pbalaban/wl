FactoryGirl.define do

  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password 'Q1w2e3r4t56y'
    password_confirmation { |u| u.password }
  end

end
