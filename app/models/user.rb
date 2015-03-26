class User < ActiveRecord::Base
  has_many :follows


  has_many :followers, class_name: 'User', through: :follows
  # has_many :followees, class_name: 'User', through: :follows

  has_many :tweets
end
