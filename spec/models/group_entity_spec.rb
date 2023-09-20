require 'rails_helper'

RSpec.describe GroupEntity, type: :model do
  it 'is valid with a group and an entity' do
    user = User.create(
      name: 'alijan',
      email: 'alijan@example.com',
      password: 'password123'
    )

    group = Group.create(
      name: 'Test Group',
      user:
    )

    entity = Entity.create(
      name: 'Test Entity',
      user:
    )

    group_entity = GroupEntity.new(
      group:,
      entity:
    )

    expect(group_entity).to be_valid
  end

  it 'is not valid without a group' do
    user = User.create(
      name: 'ali',
      email: 'ali@example.com',
      password: 'password123'
    )

    entity = Entity.create(
      name: 'Test Entity',
      user:
    )

    group_entity = GroupEntity.new(
      entity:
    )

    expect(group_entity).not_to be_valid
  end

  it 'is not valid without an entity' do
    user = User.create(
      name: 'ahmad',
      email: 'ahmad@example.com',
      password: 'password123'
    )

    group = Group.create(
      name: 'Test Group',
      user:
    )

    group_entity = GroupEntity.new(
      group:
    )

    expect(group_entity).not_to be_valid
  end
end
