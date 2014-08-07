class AddGithubToUsers < ActiveRecord::Migration
  def change
    add_column :users, :github, :boolean, :default => false
  end
end
