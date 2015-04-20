require 'spec_helper'
require 'rails_helper'

feature "user page" do

  feature "user's personal page" do

    scenario "user sees all of their goals on their page" do
      sign_in_as_tester
      user = User.find_by(username: 'testing_username')
      goal1 = user.goals.create!(title: 'goal1', private_or_public: 'private')
      goal2 = user.goals.create!(title: 'goal2', private_or_public: 'private', due_date: 2.days.ago.to_date)
      visit user_url(user)
      expect(page).to have_content(goal1.title)
      expect(page).to have_content(goal2.title)

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
      fill_in "Title", with: "VERY SPECIFIC TITLE"
      choose('private')
      click_button 'Submit New Goal'
      expect(user.goals.count).to eq(1)
      expect(page).to have_content('VERY SPECIFIC TITLE')
    end

    scenario "error messages appear on screen after invalid goal submission" do
      sign_in_as_tester
      fill_in "Title", with: "VERY SPECIFIC TITLE"
      click_button 'Submit New Goal'
      expect(page).to have_content("must be public or private")

    end

    scenario "user can complete goal without having to leave page" do

    end

    scenario "user can edit their own goals" do

    end


  end

  feature "another user's page" do

    scenario "user sees public goals"

    scenario "user does not see private goals"

  end

  scenario "seen goals are in sorted order by due date"

  scenario "seen goals are grouped by completed goals and incomplete goals"

end
