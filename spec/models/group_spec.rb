require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is valid with a name' do
    user = User.create(
      name: 'alijan',
      email: 'alijan@gmail.com',
      password: 'password123'
    )

    group = Group.new(
      name: 'Test Group',
      user:
    )

    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    user = User.create(
      name: 'ali',
      email: 'ali@gmail.com',
      password: 'password123'
    )

    group = Group.new(user:)

    expect(group).not_to be_valid
  end
end
