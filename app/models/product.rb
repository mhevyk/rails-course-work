class Product < ApplicationRecord
  has_many :cart_items
  has_many :comments
end
