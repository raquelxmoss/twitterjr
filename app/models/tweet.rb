class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  has_one :user
end
