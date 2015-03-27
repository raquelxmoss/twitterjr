require_relative '../spec_helper'

describe "the sign-up process", :type => :feature do

  before :each do
    User.create(:full_name => 'geordi dearns', :email => 'geordidearns@gmail.com', :handle => 'ilovedevacademy', :password => 'password')
  end

  after :each do
    click_on('Logout')
  end

  it "signs me up to the website" do
    visit '/'
    within ('#signup-form') do
      fill_in 'fullname', :with => 'geordi dearns'
      fill_in 'email', :with => 'geordidearns@gmail.com'
      fill_in 'handle', :with => 'ilovedevacademy'
      fill_in 'password', :with => 'password'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Tweeters'
  end
end
