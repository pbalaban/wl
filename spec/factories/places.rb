FactoryGirl.define do

  factory :place do
    name { Faker::Company.name }
    description { Faker::Lorem.sentence }
    association :user
  end

end
