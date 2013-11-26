class Customer < ActiveRecord::Base

	has_one :order
	validates_presence_of :name, :address1, :city, :zip
	validates :email, uniqueness: true
  validate  :email_regex

 	def email_regex
    if email.present? and not email.match(/\A[^@]+@[^@]+\z/)
      errors.add :email, "This is not a valid email format"
    end
  end
end


