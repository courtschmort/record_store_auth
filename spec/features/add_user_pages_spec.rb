require 'rails_helper'

describe "User sign up process" do

  it "signs up a user" do
    visit signup_path
    fill_in 'user_username', :with => 'username'
    fill_in 'user_email', :with => 'valid@example.com'
    fill_in 'user_password', :with => 'password'
    fill_in 'user_password_confirmation', :with => 'password'
    click_on 'Sign Up'
    expect(page).to have_content "You've successfully signed up!"
    expect(page).to have_content 'Albums'
  end

  it "gives an error when nothing is entered" do
    visit signup_path
    click_on 'Sign Up'
    expect(page).to have_content "There was a problem signing up."

  end
end
