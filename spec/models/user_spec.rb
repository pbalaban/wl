require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should correctly create user' do
    expect(build(:user)).to be_valid
  end
end
