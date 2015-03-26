# require 'scrypt'

class User < ActiveRecord::Base
  has_many :followee_follows, class_name: 'Follow', foreign_key: 'followee_id'
  has_many :followers, class_name: 'User', through: :followee_follows

  has_many :follower_follows, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :followees, class_name: 'User', through: :follower_follows

  has_many :tweets



  before_save do
    encrypt_password
  end

  def encrypt_password
    self.password = SCrypt::Password.create(password)
  end

  def self.authenticate(handle, password)
    if user = User.find_by(handle: handle)
      return user if SCrypt::Password.new(user.password) == password
    end
    return nil
  end

end
