class Post < ActiveRecord::Base
  # belongs_to :user, foreign_key: :user_id, class_name: 'User'
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :votes, as: :voteable

  validates :title, presence: true
  validates :url, presence: true
end