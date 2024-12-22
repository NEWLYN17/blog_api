class User < ApplicationRecord
  devise :database_authenticatable, :registerable
  
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end