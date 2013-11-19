class ProductCategory < ActiveRecord::Base

	belongs_to :product 
	belongs_to :category
	validates_presence_of :product_id, :category_id
	validates_uniqueness_of :product_id, :scope => :category_id

	#def product_category_regex
    #if product_category.uniq!
      #errors.add :email, "This category is already assigned to this product"
    #end
end
