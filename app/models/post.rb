class Post < ApplicationRecord
  belongs_to :user
  #has_many :images, as: :imageable
  has_one_attached :images
  has_many :comments, dependent: :destroy
end
