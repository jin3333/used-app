class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user

  def self.search(search)
    if search
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
  acts_as_taggable
end
