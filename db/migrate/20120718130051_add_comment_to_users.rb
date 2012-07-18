class AddCommentToUsers < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
    add_index :comments, [:user_id, :created_at]



  end
end
