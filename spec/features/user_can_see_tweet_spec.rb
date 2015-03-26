require_relative '../spec_helper'
require 'faker'

describe "the sign-up process", :type => :feature do
  before :each do
    User.create(:full_name => 'geordi dearns', :email => 'geordidearns@gmail.com', :handle => 'ilovedevacademy', :password => 'password')
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
    expect(page).to have_content ''
  end
end

##############################################

describe "the login process", :type => :feature do
  before :each do
    User.create(:handle => 'geordi', :password => 'password')
  end

  it "logs me in to a session" do
    visit '/'
    within ('#login-form') do
      fill_in 'handle', :with => 'geordi'
      fill_in 'password', :with => 'password'
    end
    click_button 'Login'
    expect(page).to have_content ''
  end
end

################################################

describe 'user can see tweet', feature: true do

  before do
    @user = User.create(email: Faker::Internet.email)
    @tweet = Tweet.create(status: Faker::Lorem.sentence, user: @user)
  end

  it 'Get /tweets contains tweets' do
    visit '/tweets'
    expect(page).to have_content(@tweet.status)

  end

end
