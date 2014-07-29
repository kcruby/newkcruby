class AddIndexToBlogs < ActiveRecord::Migration
  def change
  	add_index :blogs, [:user_id, :created_at]
  end
end
