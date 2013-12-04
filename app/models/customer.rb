class Customer < ActiveRecord::Base

	has_one :order
	validates_presence_of :name, :address1, :city, :zip
	
end


