class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  validates :title, presence: true
  validates :content, presence: true
  
  scope :search_by_title, ->(query) { where("title LIKE ?", "%#{query}%") }
  
  def self.paginate(page: 1, per_page: 10)
    page = [page.to_i, 1].max
    offset = (page - 1) * per_page
    limit(per_page).offset(offset)
  end
end