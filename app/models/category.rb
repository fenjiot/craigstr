class Category < ActiveRecord::Base
  belongs_to :region

  has_many :post_categories
  has_many :posts, through: :post_categories
end
