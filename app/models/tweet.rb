class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user

  has_many :retweets, :class_name => "Tweet", :foreign_key => "id"
  belongs_to :parent_tweet, :class_name => "Tweet", :foreign_key => "id"

end
