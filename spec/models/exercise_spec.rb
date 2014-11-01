require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it 'should correctly create exercise' do
    expect(build(:exercise)).to be_valid
  end
end
