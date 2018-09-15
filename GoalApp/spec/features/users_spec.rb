require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New User'
  end
  
  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'parkg748'
      fill_in 'password', with: 'password'
      click_on 'Sign Up'
    end
    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'parkg748'
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    User.create(username: 'parkg748', password: 'password')
    visit new_session_url
    fill_in 'Username', with: 'parkg748'
    fill_in 'Password', with: 'password'
    click_on 'Sign In'
    expect(page).to have_content 'parkg748'
  end
  
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit new_session_url
    expect(page).not_to have_content 'Log Out'
  end

  scenario 'doesn\'t show username on the homepage after logout' do 
    visit new_session_url
    expect(page).not_to have_content 'parkg748'
  end

end