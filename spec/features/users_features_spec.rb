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

    it 'successfully adds a session hash on signup' do
        visit '/signup'
        fill_in 'user_username', :with => 'test'
        fill_in 'user_password', :with => 'test123'
        click_button 'Create Account'
        expect(page.get_rack_session_key('user_id')).to_not eq(nil)
    end 

    it 'successfully logs in' do
        User.create(:username => 'test', :password => 'test123')
        visit '/login' 
        fill_in 'username', :with => 'test'
        fill_in 'password', :with => 'test123'
        click_button 'Log In'
        expect(page).to have_content("Welcome, test")
    end 

    it 'successfully adds session hash on login' do
        User.create(:username => 'test', :password => 'test123')
        visit '/login' 
        fill_in 'username', :with => 'test'
        fill_in 'password', :with => 'test123'
        click_button 'Log In'
        expect(page.get_rack_session_key('user_id')).to_not eq(nil)
    end 
end 