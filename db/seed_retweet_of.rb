@tweets = Tweet.all

@tweets.each do |tweet|
  begin
    users = User.all.sample(rand(1..6))
  end while users.include?(tweet.user)
  users.each do |user|
      Tweet.create(status: tweet.status, user: user, retweet_of: tweet.id )
  end


end
