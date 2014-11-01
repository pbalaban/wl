FactoryGirl.define do

  factory :workout do
    date { Date.current }
    association :place
  end

end
