require 'faker'

User.delete_all
Tweet.delete_all
Retweet.delete_all

10.times do
  User.create( email: Faker::Internet.email, handle:Faker::Internet.user_name, gravatar:Faker::Avatar.image)
end

# #seed Tweets
20.times do
  Tweet.create( status: Faker::Lorem.sentences.join(' '), user_id:rand(1..10) )
end

#seed Retweets
20.times do
  @my_tweets = Tweet.all
  @my_tweets.each do |my_tweet|
    if my_tweet.id.even?
      # get a user.id
      user_id = User.find( rand( (User.count+1)..((User.count)*2) ) ).id
      #puts user_id
      Retweet.create( user_id: user_id, tweet_id: my_tweet.id)
    end
  end
end

puts 'Seed complete !!.'
