class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :belongs_to, :user
  end
end
