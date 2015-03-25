class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  has_one :user

  has_many :users, :through: :retweets
end
