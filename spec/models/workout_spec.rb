require 'rails_helper'

RSpec.describe Workout, type: :model do
  it 'should correctly create workout' do
    expect(build(:workout)).to be_valid
  end
end
