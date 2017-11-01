class Sub < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :moderator,
  class_name: :User,
  primary_key: :id,
  foreign_key: :user_id

  has_many :postsubs, inverse_of: :sub
  has_many :posts, through: :postsubs

end
