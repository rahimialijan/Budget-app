# spec/controllers/groups_controller_spec.rb

require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response when the user is signed in' do
      user = FactoryBot.create(:user) # Create a test user
      sign_in user # Sign in the user

      get :index
      expect(response).to be_successful
    end

    it 'returns a redirect response when the user is not signed in' do
      get :index
      expect(response).to redirect_to(new_user_session_path) # Adjust this to your authentication path
    end
  end

  describe 'GET #new' do
    it 'returns a successful response when the user is signed in' do
      user = FactoryBot.create(:user) # Create a test user
      sign_in user # Sign in the user

      get :new
      expect(response).to be_successful
    end

    it 'returns a redirect response when the user is not signed in' do
      get :new
      expect(response).to redirect_to(new_user_session_path) # Adjust this to your authentication path
    end
  end

  describe 'POST #create' do
    it 'creates a new group and redirects on success when the user is signed in' do
      user = FactoryBot.create(:user) # Create a test user
      sign_in user # Sign in the user

      group_attributes = FactoryBot.attributes_for(:group) # Replace :group with your FactoryBot factory name

      expect do
        post :create, params: { group: group_attributes }
      end.to change(Group, :count).by(1)

      expect(response).to redirect_to(groups_path)
      expect(flash[:notice]).to eq('Category created successfully.')
    end

    it "renders 'new' template on failure when the user is signed in" do
      user = FactoryBot.create(:user) # Create a test user
      sign_in user # Sign in the user

      invalid_group_attributes = { name: '' } # Provide invalid attributes

      expect do
        post :create, params: { group: invalid_group_attributes }
      end.not_to change(Group, :count)

      expect(response).to render_template('new')
    end

    it 'returns a redirect response when the user is not signed in' do
      post :create, params: { group: FactoryBot.attributes_for(:group) }
      expect(response).to redirect_to(new_user_session_path) # Adjust this to your authentication path
    end
  end

  # Add more tests for other actions as needed
end
