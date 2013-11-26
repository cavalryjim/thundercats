class Order < ActiveRecord::Base

	belongs_to :customer
	has_many :line_items

	CURRENT_SALES_TAX = 0.06

	def self.sales_tax_in_percent
		return 
			CURRENT_SALES_TAX * 100
	end
	
end
