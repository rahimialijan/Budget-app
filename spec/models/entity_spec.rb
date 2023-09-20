require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'is valid with a name' do
    user = User.create(
      name: 'alijan',
      email: 'alijan@example.com',
      password: 'password123'
    )

    entity = Entity.new(
      name: 'Test Entity',
      user:
    )

    expect(entity).to be_valid
  end

  it 'is not valid without a name' do
    user = User.create(
      name: 'ali',
      email: 'ali@example.com',
      password: 'password123'
    )

    entity = Entity.new(user:)

    expect(entity).not_to be_valid
  end
end
