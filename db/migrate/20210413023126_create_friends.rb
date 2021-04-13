class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.bigint :follower_id
      t.bigint :followee_id
      t.boolean :is_deleted, default: false

      t.timestamps
    end

    add_index :friends, [:follower_id, :followee_id], unique: true
  end
end
