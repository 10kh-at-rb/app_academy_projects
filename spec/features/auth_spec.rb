require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New user"
  end

    feature "signing up a user" do
      before(:each) do
        visit new_user_url
        fill_in 'Username', with: 'testing_username'
        fill_in 'Password', with: 'password'
      end


      scenario "user can't sign-in in with a blank password" do
        fill_in 'Password', with: ''
        click_on "Create User"
        expect(page).to have_content "Password is too short"
        expect(page).to have_content "New user"
      end

      scenario "user can't sign-in with a blank username" do
        fill_in 'Username', with: ''
        click_on "Create User"
        expect(page).to have_content "Username can't be blank"
        expect(page).to have_content "New user"
      end

      scenario "shows username on the homepage after signup"  do
        click_on "Create User"
        expect(page).to have_content 'testing_username'
        expect(page.current_path).to_not eq new_user_url
      end

    end

end

  feature "logging in" do

      before(:each) do
        visit new_user_url
        fill_in 'Username', with: 'testing_username'
        fill_in 'Password', with: 'password'
        click_on 'Create User'
        click_on 'Sign Out'
        fill_in 'Username', with: 'testing_username'
        fill_in 'Password', with: 'password'
      end

    scenario "shows username on the homepage after login" do
      # save_and_open_page
      click_on 'Sign In'
      expect(page).to have_content 'testing_username'
      expect(page).to have_content 'Sign Out'
    end

  end

  feature "logging out" do

    scenario "begins with logged out state" do
      visit root_url
      expect(page).to have_content 'Username'
      expect(page).to have_content 'Password'
    end

    scenario "doesn't show username on the homepage after logout" do
      visit new_user_url
      fill_in 'Username', with: 'testing_username'
      fill_in 'Password', with: 'password'
      click_on 'Create User'
      click_on "Sign Out"

      expect(page).to_not have_content "testing_username"
    end

  end
