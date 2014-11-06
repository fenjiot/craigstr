class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
  belongs_to :region

  has_many :post_categories
  has_many :categories, through: :post_categories
end
