require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:sample_user) {FactoryGirl.build(:user)}

  it '#new' do
    get :new
    expect(assigns(:user)).to be_a_kind_of(User)
  end

  context '#create' do
    it 'creates a new user with valid params' do
      expect{
        post :create, user: FactoryGirl.attributes_for(:user)
      }.to change(User, :count).by(1)
    end

    it 'does not create a user with invalid params' do
      expect{
        post :create, user: {username: "sdf"}
      }.to_not change(User, :count)
    end

    it 'redirects to the root_path when the user is created' do
      expect(
        post :create, user: FactoryGirl.attributes_for(:user)
      ).to redirect_to root_path
    end

    it 'render new when user fails to create' do
      expect(
        post :create, user: {username: "sdf"}
      ).to render_template(:new)
    end
  end

end
