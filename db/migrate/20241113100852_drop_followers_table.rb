class DropFollowersTable < ActiveRecord::Migration[7.2]
  def up
    drop_table :followers
  end

  def down
    create_table :followers do |t|
      t.integer :follower_id
      t.integer :user_id
      t.timestamps
    end
    
    add_index :followers, [:follower_id, :user_id], unique: true
    add_index :followers, :follower_id
    add_index :followers, :user_id
  end
end
