
class ChangeTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :user_id, :integer
    remove_column :tweets, :owner, :string
  end
end
