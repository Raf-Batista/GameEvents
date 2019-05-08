require 'rails_helper'

RSpec.describe 'User signup', type: :feature do 
    it 'successfully signs up a user' do
        visit '/signup'
        fill_in 'user_username', :with => 'test'
        fill_in 'user_password', :with => 'test123'
        click_button 'Create Account'
        expect(current_path).to eq('/users/1')
        expect(page).to have_content("Welcome, test")
    end 

    it 'on sign up, successfully adds a session hash' do
        visit '/signup'
        fill_in 'user_username', :with => 'test'
        fill_in 'user_password', :with => 'test123'
        click_button 'Create Account'
        expect(page.get_rack_session_key('user_id')).to_not be_nil
    end 
end 