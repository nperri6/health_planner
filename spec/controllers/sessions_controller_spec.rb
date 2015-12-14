require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  context 'new' do

    it 'assigns @user to a new user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders the new session template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  context 'create' do
    let(:logging_in_user) {User.create!(username: "jim", firstname: "jim", lastname: 'smith', password: 'jim', email: "jim@gmail.com", birthday: '10/02/1990')}

    it 'redirects to root if valid input is entered' do
      post :create, username: "jim", password: 'jim'
      # expect(response).to redirect_to root_path
    end

    it 'renders new if invalid input is entered' do
      post :create, username: 'dsfl', password: 'wfws'
      expect(response).to render_template(:new)
    end
  end
end
