FactoryGirl.define do

  factory :exercise_item do
    association :exercise
    association :workout
    time 12
    repeats_count 13
    weight 20
  end

end
