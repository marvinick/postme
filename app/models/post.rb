class Post < ActiveRecord::Base
  # belongs_to :user, foreign_key: :user_id, class_name: 'User'
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :votes, as: :voteable

  after_validation :generate_slug

  validates :title, presence: true
  validates :url, presence: true

  def total_votes
    self.up_votes - self.down_votes
  end

  def up_votes
    self.votes.where(vote: true).size
  end

  def down_votes
    self.votes.where(vote: false).size
  end

  def to_param
    self.slug
  end

  def generate_slug
    self.slug = self.title.gsub(' ', '-').downcase
  end
end
