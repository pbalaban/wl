FactoryGirl.define do

  factory :exercise do
    sequence(:name) { |n| "Exercise ##{n}" }
    values_type { Exercise::VALUES_TYPES.map(&:last).sample }
    muscle_group { Exercise::MUSCLE_GROUPS.sample }
    association :place
  end

end
