class AddSpotFieldToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :spot, :text
  end
end
