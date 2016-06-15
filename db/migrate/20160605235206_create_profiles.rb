class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :user_name
      t.string :email
      t.string :password
      t.string :profile_pic
      t.integer :capacity
      t.integer :load
      t.timestamps null: false
    end
  end
end
