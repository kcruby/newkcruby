class Blog < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	default_scope -> { order('created_at DESC') }
    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 100 }
    validates :message, presence: true, length: { maximum: 2000 }
end
