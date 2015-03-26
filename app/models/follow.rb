class Follow < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'

  validates_uniqueness_of :follower_id, scope: :followee_id #make sure ever follower id is
  validates_uniqueness_of :followee_id, scope: :follower_id
end
