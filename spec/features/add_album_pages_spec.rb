require 'rails_helper'

describe "the add a album process" do

  before(:each) do
    visit signup_path
    fill_in 'user_username', :with => 'username'
    fill_in 'user_email', :with => 'valid@example.com'
    fill_in 'user_password', :with => 'password'
    fill_in 'user_password_confirmation', :with => 'password'
    click_on 'Sign Up'
  end

  it "adds a new album" do
    visit albums_path
    click_on 'Create new album'
    fill_in 'Name', :with => 'Dark Side of the Moon'
    fill_in 'Genre', :with => 'Rock'
    click_on 'Create Album'
    expect(page).to have_content 'Album successfully added!'
    expect(page).to have_content 'Dark Side Of The Moon'
  end

  it "gives an error when no name is entered" do
    visit new_album_path
    click_on 'Create Album'
    expect(page).to have_content "Name can't be blank"
  end
end
