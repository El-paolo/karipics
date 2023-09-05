class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_many :images, as: :imageable
  # accepts_nested_attributes_for :images
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :images
  has_many :posts
  has_many :comments
  enum :role, [:normal_user, :admin]

end
