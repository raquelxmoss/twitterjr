class User < ActiveRecord::Base
  has_many :followings, foreing_key: 'follower_id'
  has_many :followers, class_name: 'User', through: :followings,  foreing_key: 'follower_id'
  has_many :followees, class_name: 'User', through: :followings,  foreing_key: 'followee_id'
  has_many :tweets
end
