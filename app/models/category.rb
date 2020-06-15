class Category < ApplicationRecord
  has_ancestry
  has_many :children, class_name: :Category, foreign_key: :parent_id 
  has_many :posts
end
