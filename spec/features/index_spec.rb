require 'spec_helper'

feature 'Visitor browsing the index' do
  context 'on home#index page' do
    before(:each) do
      visit root_path
    end

    it 'has a link to login' do
      click_link "Login"
      expect(current_path).to eq(signin_path)
    end

    it 'has a link to signup' do
      click_link "Signup"
      expect(current_path).to eq(signup_path)
    end
  end
end
