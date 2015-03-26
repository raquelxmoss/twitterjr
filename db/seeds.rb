require 'faker'

User.delete_all
Tweet.delete_all
Retweet.delete_all

#Create specific profiles for testing
require_relative 'seed_my_profile'
#create ten uers
20.times do

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
require_relative 'seed_followers'

# #seed Tweets
20.times do
  Tweet.create( status: Faker::Lorem.sentences.join(' '), user: User.all.sample )
end



puts 'Seed complete !!.'

