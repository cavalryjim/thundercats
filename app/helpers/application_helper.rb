module ApplicationHelper
	def prettify_address(customer)
		address = customer.address1
		if ! customer.address2.blank? 
			address += "<br/>" + customer.address2
		end
		address += "<br/" + customer.city
		address += ", " + customer.state
		address += "  " + customer.zip
		#return address   don't have to put this in ruby
	end

end
