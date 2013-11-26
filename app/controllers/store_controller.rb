class StoreController < ApplicationController
  
  def index
    category_name = params[:category_name]
    if category_name.blank?
      @products = Product.all
    else
      @products = Category.find_by_name(category_name).products
    end
  	
    Rails.logger.info "CART= #{session[:cart]}"
      if session[:cart].nil?
        session[:cart] = {}
      end
   
    @cart = session[:cart]
    
    #session.clear
    @subtotal = Cart.calculate_subtotal(@cart)
  end 

  def add_cart
    product_id = params[:product_id]
    quantity = params[:quantity].to_i
    @product_name = params[:product_name]
    price = params[:price].to_f

    #this is a hash in a hash...
      if session[:cart].nil?
        session[:cart] = {}
      
      end
    
    current_cart = session[:cart]
        #current_cart is now a hash that holds another hash
      if current_cart[product_id].nil?
        current_cart[product_id] = [quantity, @product_name, price]
        
      else
        value_array = current_cart[product_id]
        current_cart[product_id] = value_array
        
        old_quantity = value_array[0]
        new_quantity = old_quantity + quantity
        current_cart[product_id] = [new_quantity, @product_name, price]
      end
    @cart = current_cart
    
      #to write to server log:
    Rails.logger.info "CART= #{session[:cart]}"
    
    @subtotal = Cart.calculate_subtotal(@cart)

    Rails.logger.info "SUBTOTAL= #{@subtotal}"
  end

  def delete_cart
  end

  def show
  	@category = Category.new
  	@product = @category.product
  end
end
