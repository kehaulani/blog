require 'rails_helper'

feature 'site' do
    scenario "user visits home page and sees welcome" do
        visit root_path

        expect(page).to have_content("Home")

    end

    scenario "user visits about page and sees about" do
        visit root_path

        page.should have_content("About")
    end

end
