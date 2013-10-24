class Post < ActiveRecord::Base
  include VoteableMarvOct
  # belongs_to :user, foreign_key: :user_id, class_name: 'User'
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments

  after_validation :generate_slug

  validates :title, presence: true
  validates :url, presence: true

  def to_param
    self.slug
  end

  def generate_slug
    self.slug = self.title.gsub(' ', '-').downcase
  end
end
