class Product < ActiveRecord::Base

	paginates_per 3
	
	has_many :line_items
	has_many :product_categories, dependent: :destroy
	has_many :categories, through: :product_categories
	validates_presence_of :name, :unit_price, :quantity, :sku, :model_num


end
