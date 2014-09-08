class Comment < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user, class_name: User
end
