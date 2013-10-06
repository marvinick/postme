class User < ActiveRecord::Base
  has_many :posts, foreign_key: :user_id
  has_many :comments
end