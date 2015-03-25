class CreateUsers < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :handle
      t.string :email
      t.string :full_name
      t.string :password
      t.string :gravatar

      t.timestamps null: false
    end
  end
end
