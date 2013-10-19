class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  has_many :votes, as: :voteable

  validates :body, presence: true


def votes_total
  self.up_votes - self.down_votes
end

def up_votes
  self.votes.where(vote: true).size
end

def down_votes
  self.votes.where(vote: false).size
end

end