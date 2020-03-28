class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  validates :image, presence: true

  def self.search(search)
    if search
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
  acts_as_taggable
  def like_user(user_id)
    likes.find_by(user_id: user_id)
   end
end

