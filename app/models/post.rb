class Post < ApplicationRecord
  validates :title, presence: true
  validates :subs, presence: true

  belongs_to :author,
  class_name: :User,
  primary_key: :id,
  foreign_key: :user_id

  has_many :postsubs, inverse_of: :post
  has_many :subs, through: :postsubs
end
