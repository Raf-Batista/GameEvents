require 'rails_helper'

RSpec.describe 'User signup', type: :feature do 
    it 'signs up a user' do
        visit '/signup'
        fill_in 'Email', :with => 'test@email.com'
        fill_in 'Username', :with => 'test'
        fill_in 'Password', :with => 'test123'
        click_button 'Create Account'
        expect(current_path).to eq('/users/1')
        expect(page).to have_content("welcome test")
    end 
end 