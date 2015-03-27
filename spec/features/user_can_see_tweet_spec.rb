require_relative '../spec_helper'
require 'faker'

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
