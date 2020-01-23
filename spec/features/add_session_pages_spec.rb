require 'rails_helper'

describe "User sign in process" do

  it "signs in a user" do
    visit signup_path
    fill_in 'user_username', :with => 'username'
    fill_in 'user_email', :with => 'valid@example.com'
    fill_in 'user_password', :with => 'password'
    fill_in 'user_password_confirmation', :with => 'password'
    click_on 'Sign Up'

    visit signin_path
    fill_in 'input', :with => 'valid@example.com'
    fill_in 'password', :with => 'password'
    click_on 'Sign in'
    expect(page).to have_content "You've signed in."
  end
end
