class User < ActiveRecord::Base
  has_many :posts, foreign_key: :user_id
  has_many :comments
  has_many :votes
  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 3}

  def admin?
    self.role == 'admin'
  end

  def moderator?
    self.role == 'moderator'
  end
end