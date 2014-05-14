class AddUserIdToPostsAndComments < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
    add_column :comments, :user_id, :integer
    add_index :posts, :user_id
    add_index :comments, :user_id
    remove_column :comments, :commenter, :string
  end
end
