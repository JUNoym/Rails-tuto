class AddIndexToUsersEmail < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :email, unique: true
    # usersテーブルのemailカラムにインデックスを追加するためにadd_indexというRailsのメソッドを使っている
  end
end
