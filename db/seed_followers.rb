

@users = User.all

#set a random number between 1 to 5 followers to each user
@users.each do |user|
    followers = @users.all.sample(rand(1..5))
    followers.each do |follower|
      user.followers << follower
  end
end
