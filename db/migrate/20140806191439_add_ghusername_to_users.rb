class AddGhusernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ghusername, :string
  end
end
