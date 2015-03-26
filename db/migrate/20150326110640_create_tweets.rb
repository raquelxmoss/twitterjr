class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :status
      t.string :owner
      t.timestamps null: false
    end
  end
end
