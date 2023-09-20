# spec/models/entity_spec.rb

require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { create(:user) }
  let(:group) { create(:group) } # Assuming you have FactoryBot set up for User and Group models

  it 'is valid with valid attributes' do
    entity = described_class.new(name: 'Sample Transaction', user: user)
    entity.groups << group

    expect(entity).to be_valid
  end

  it 'is not valid without a name' do
    entity = described_class.new(user: user)
    entity.groups << group

    expect(entity).not_to be_valid
    expect(entity.errors[:name]).to include("can't be blank")
  end

  it 'is associated with a user' do
    entity = described_class.new(name: 'Sample Transaction', user: user)
    entity.groups << group

    expect(entity.user).to eq(user)
  end

  it 'is associated with a group' do
    entity = described_class.new(name: 'Sample Transaction', user: user)
    entity.groups << group

    expect(entity.groups).to include(group)
  end
end
