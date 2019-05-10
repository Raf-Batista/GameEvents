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

    context 'When logged in' do
        it 'redirects to show page when user visits home' do
            user = User.create(:username => 'test', :password => 'test123')
            page.set_rack_session(:user_id => user.id)
            visit root_path 
            expect(current_path).to eq(user_path(user))
        end

        it 'redirects to show page when user visits login' do
            user = User.create(:username => 'test', :password => 'test123')
            page.set_rack_session(:user_id => user.id)
            visit login_path 
            expect(current_path).to eq(user_path(user))
        end

        it 'redirects to show page when user visits signup' do
            user = User.create(:username => 'test', :password => 'test123')
            page.set_rack_session(:user_id => user.id)
            visit signup_path 
            expect(current_path).to eq(user_path(user))
        end

        it 'can log out' do
            page.set_rack_session(:user_id => 1)
            visit logout_path 
            expect(page.get_rack_session['user_id']).to eq(nil)
        end

        it 'redirects to home page after logging out' do
            page.set_rack_session(:user_id => 1)
            visit logout_path 
            expect(page.current_path).to eq(root_path)
        end


        it 'can visit games index page' do
            page.set_rack_session(:user_id => 1)
            visit games_path 
            expect(page.current_path).to eq(games_path)
        end 

        it 'can visit a games show page' 
 
        it 'can visit games index page owned by a user'

        it 'can visit a games show page owned by a user'

        it 'can create an game owned by a user' do
            visit new_user_game_path 
            fill_in 'title', :with => 'Street Fighter 2'
            fill_in 'publisher', :with => 'Capcom'
            fill_in 'release_date', :with => '1992'
            check 'Fighting'
            click 'Create Game'
            expect(page.content).to have_content(/Street Fighter 2 Capcom 1992 Fighting/)
        end 

        it 'can visit events index page' 

        it 'can visit an events show page'

        it 'can visit events index page owned by a user' 

        it 'can visit an events show page owned by a user'

    end 

    context 'when logged out' do  
        before(:example) { page.set_rack_session(:user_id => nil) }
        it 'redirects to home page when trying to log out' do
            visit logout_path 
            expect(page.current_path).to eq(root_path)
        end 

        it 'can not view a users show page' do
            visit '/users/1' 
            expect(page.current_path).to eq(login_path)
        end 

        it 'can not view games show page' do
            visit 'games/1'
            expect(page.current_path).to eq(login_path)
        end 

        it 'can not view games index page' do
            visit games_path 
            expect(page.current_path).to eq(login_path)
        end

        it 'can not view event show page' do
            visit 'events/1'
            expect(page.current_path).to eq(login_path)
        end 

        it 'can not view event index page' do
            visit events_path
            expect(page.current_path).to eq(login_path)
        end 

        it 'can not create a new event' do
            visit 'events/new'
            expect(page.current_path).to eq(login_path)
        end 

        it 'can not edit an existing event' do
            visit 'games/1/edit'
            expect(page.current_path).to eq(login_path)
        end 
    end 
end 