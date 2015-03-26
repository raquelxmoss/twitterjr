require 'faker'

# User.delete_all
# Tweet.delete_all
# Retweet.delete_all

# # Seed Users
# 10.times do
#   User.create( email: Faker::Internet.email )
# end

# #seed Tweets
# 20.times do
#   Tweet.create( status: Faker::Lorem.sentences.join(' ') )
# end

# seed Retweets
# 20.times do
  @my_tweets = Tweet.all
  @my_tweets.each do |the_tweet|
    #if the_tweet.id.even?
      # get a user.id
      user_id = User.find( rand( (User.count+1)..((User.count)*2) ) ).id
      puts user_id
      the_tweet.user_id = user_id
      the_tweet.save
      # Retweet.create( user_id: user_id, tweet_id: my_tweet.id)
    #end
  end
# end

# seed Retweets
# 20.times do
  # @my_users = User.all
  # @my_users.each do |the_user|
  #   if the_tweet.id.even?
  #     # get a user.id
  #     user_id = User.find( rand( (User.count+1)..((User.count)*2) ) ).id
  #     #puts user_id
  #     my_w
  #     # Retweet.create( user_id: user_id, tweet_id: my_tweet.id)
  #   end
  # end
# end

puts 'Seed complete !!.'

