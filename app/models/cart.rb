class Cart 
	def self.calculate_subtotal(cart)
    subtotal = 0
    cart.each do |key,value_array|
	    qty = value_array[0]
	    price = value_array[2]
	    item_total = qty * price 
	    subtotal = subtotal + item_total
	  end
	  return subtotal
	end
end

