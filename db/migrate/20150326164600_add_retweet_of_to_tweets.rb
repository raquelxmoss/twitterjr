class AddRetweetOfToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :retweet_of, :integer
  end
end
