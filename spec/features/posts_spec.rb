require 'rails_helper'

feature 'Posts:' do
    scenario 'user creates a post' do
        login_a_user

        visit posts_path
        click_link "New Post"

        fill_in "Title", with: "My new test post"
        fill_in "Body", with: "This is a test post"
        click_button "Create Post"

        page.should have_content("Successfully created posts.")
        page.should have_content("My new test post")

    end

    scenario 'user edits a post' do
        user = login_a_user
        post1 = FactoryGirl.create :post, user: user

        visit post_path(post1)
        page.should have_content(post1.title)

        click_link "Edit Post"
        fill_in "Title", with: "Testing edits..."
        fill_in "Body", with: "Test 1 edit"
        click_button "Update Post"
        page.should have_content("Successfully saved post.")
        page.should have_content("Test 1 edit")
    end

    scenario 'user deletes a post' do
        login_a_user

        user = login_a_user
        post1 = FactoryGirl.create :post, user: user

        visit post_path(post1)
        page.should have_content(post1.title)

        #Delete post
        click_link "Delete Post"
        def confirm_dialog
          a = page.driver.browser.switch_to.alert
          if a.text == 'OK'
            a.accept
          else
            a.dismiss
          end
      end
    end

    scenario 'User fails to create post' do
        login_a_user

        visit new_post_path

        fill_in "Title", with: ""
        fill_in "Body", with: "Hellooo"
        click_button "Create Post"

        page.should have_content("fix the errors")
    end

    scenario "User should only see his posts" do
        user = login_a_user
        post1 = FactoryGirl.create :post, user: user #Passing the logged in user to make this post belong to him.
        post2 = FactoryGirl.create :post #This post will belong to a newly generated user by the factory

        visit posts_path
        page.should have_content(post1.title)
        page.should_not have_content(post2.title)
    end

end
