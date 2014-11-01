require 'rails_helper'

RSpec.describe Place, type: :model do
  it 'should correctly create place' do
    expect(build(:place)).to be_valid
  end
end
