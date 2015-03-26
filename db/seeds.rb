require 'faker'

User.delete_all
Tweet.delete_all
Retweet.delete_all

10.times do

  options = {
    handle: Faker::Lorem.word,
    email: Faker::Internet.email,
    full_name: Faker::Name.name,
    bio: Faker::Lorem.sentence,
    password: Faker::Internet.password,
    gravatar: Faker::Avatar.image
  }
  User.create(options)

end
# my personnal profile
  options = {
    handle: 'alexb52',
    email: 'barretalexandre@hotmail.com',
    full_name: 'Alexandre Barret',
    bio: 'Nothing much today',
    password: 'cookie',
    gravatar: Faker::Avatar.image
  }
  User.create(options)


# #seed Tweets
20.times do
  Tweet.create( status: Faker::Lorem.sentences.join(' '), user_id:rand(1..10) )
end

#seed Retweets
# 20.times do
#   @my_tweets = Tweet.all
#   @my_tweets.each do |my_tweet|
#     if my_tweet.id.even?
#       # get a user.id
#       user_id = User.find( rand( (User.count+1)..((User.count)*2) ) ).id
#       #puts user_id
#       Retweet.create( user_id: user_id, tweet_id: my_tweet.id)
#     end
#   end
# end

puts 'Seed complete !!.'

