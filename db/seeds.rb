require 'faker'

User.delete_all
Tweet.delete_all

10.times do

  User.create(email: Faker::Internet.email)
end

20.times do
  Tweet.create(status: Faker::Lorem.sentences)
end




