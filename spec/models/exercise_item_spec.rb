require 'rails_helper'

RSpec.describe ExerciseItem, type: :model do
  it 'should correctly create exercise_item' do
    expect(build(:exercise_item)).to be_valid
  end
end
