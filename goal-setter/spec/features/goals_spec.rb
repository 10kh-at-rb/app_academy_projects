require 'spec_helper'
require 'rails_helper'

feature "user page" do

  feature "user's personal page" do

    scenario "user sees all of their goals on their page" do
      sign_in_as_tester
      tester_makes_private_goal
      tester_makes_public_goal
      visit user_url(tester)
      expect(page).to have_content('private_goal')
      expect(page).to have_content('public_goal')

      expect(page).to_not have_content("goal3")
    end

    scenario "user sees form for new goals" do
      sign_in_as_tester
      expect(page).to have_content('New Goal')
      expect(page).to have_button 'Submit New Goal'
    end

    scenario "user can submit new goals" do
      sign_in_as_tester
      user = User.find_by(username: 'testing_username')
      tester_makes_private_goal
      expect(user.goals.count).to eq(1)
      expect(page).to have_content('private_goal')
    end

    scenario "error messages appear on screen after invalid goal submission" do
      sign_in_as_tester
      fill_in "Title", with: "VERY SPECIFIC TITLE"
      click_button 'Submit New Goal'
      expect(page).to have_content("must be public or private")

    end

    scenario "user can complete goal without having to leave page" do
      sign_in_as_tester
      tester_makes_private_goal
      check 'check_private_goal'
      click_button 'mark goal as complete'
      expect(page).to have_button('mark goal as incomplete')

    end

    scenario "user can edit their own goals" do
      sign_in_as_tester
      tester_makes_private_goal
      expect(page).to have_content('Edit This Goal')
    end

    scenario "users can see the due date of their goals" do
      sign_in_as_tester
      tester_makes_dated_goal1
      save_and_open_page
      expect(page).to have_content('Due: 1980-08-27')
    end

    scenario "seen goals are in sorted order by due date"

    scenario "seen goals are grouped by completed goals and incomplete goals"


  end

  feature "another user's page" do

    scenario "user sees public goals"

    scenario "user does not see private goals"

  end


end
