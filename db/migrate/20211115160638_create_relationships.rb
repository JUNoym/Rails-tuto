class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    add_index :relationships, [:follower_id, :followed_id], unique: true
    # ここで複合インデックスが使われている理由は
    # follower_idとfollowed_idの組み合わせが必ずユニークであることを保証する仕組みです。これにより、あるユーザーが同じユーザーを2回以上フォローすることを防ぎます
  end
end
