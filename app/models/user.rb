require 'scrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
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
