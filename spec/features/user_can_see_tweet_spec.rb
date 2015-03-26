require_relative '../spec_helper'
require 'faker'


describe "the signin process", :type => :feature do
  before :each do
    User.create(:handle => 'geordi', :password => 'password')
  end

  it "signs me in" do
    visit '/'
    within ('#login-form') do
      fill_in 'handle', :with => 'geordi'
      fill_in 'password', :with => 'password'
    end
    click_button 'Login'
    expect(page).to have_content ''
  end
end

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
