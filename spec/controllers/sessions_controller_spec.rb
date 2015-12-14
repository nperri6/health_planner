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
      post :create, username: logging_in_user.username, password: logging_in_user.password
      expect(response).to redirect_to root_path
    end

    it 'renders new if invalid input is entered' do
      post :create, username: 'dsfl', password: 'wfws'
      expect(response).to render_template(:new)
    end
  end

  context 'destroy' do
    let(:logging_in_user) {User.create!(username: "jim", firstname: "jim", lastname: 'smith', password: 'jim', email: "jim@gmail.com", birthday: '10/02/1990')}
    it 'clears the session' do
      post :create, username: logging_in_user.username, password: logging_in_user.password
      get :destroy
      expect(session[:user_id]).to eq(nil)
    end

    it 'redirects to root path' do
      post :create, username: logging_in_user.username, password: logging_in_user.password
      get :destroy
      expect(response).to redirect_to root_path
    end

  end
end
