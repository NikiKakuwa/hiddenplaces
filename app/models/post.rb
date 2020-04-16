class Post < ApplicationRecord
    attachment :post_image
    validates :title, :body, presence: true
	validates :body, length: { maximum: 500 }
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
