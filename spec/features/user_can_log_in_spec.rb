require_relative '../spec_helper'
require 'faker'

describe "the login process", :type => :feature do
  before :each do
    User.create(:handle => 'geordi', :password => 'password')
  end

  after :each do
    click_on('Logout')
  end

  it "logs me in to a session" do
    visit '/'
    within ('#login-form') do
      fill_in 'handle', :with => 'geordi'
      fill_in 'password', :with => 'password'
    end
    click_button 'Login'
    expect(page).to have_content 'Feed'
  end
end
