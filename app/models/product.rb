class Product < ApplicationRecord
 belongs_to :category, optional: true
 validates :url , presence: true ,uniqueness: true
end
