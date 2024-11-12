class CreateFollowers < ActiveRecord::Migration[7.2]
  def change
    create_table :followers do |t|
      t.references :follower, foreign_key: { to_table: :users }
      t.references :user, foreign_key: { to_table: :users }
      t.timestamps
    end
    add_index :followers, [:follower_id, :user_id], unique: true
  end
end
