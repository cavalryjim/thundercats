class StoreController < ApplicationController

  def contact_us
  end
  
  def index
    category_name = params[:category_name]
    if category_name.blank?
      @products = Product.where('quantity > 0').order(:name).page(params[:page])
    else
      @products = Category.find_by_name(category_name).products.where('quantity > 0').order(:name).page(params[:page])
    end
  	
    Rails.logger.info "CART= #{session[:cart]}"
      if session[:cart].nil?
        session[:cart] = {}
      end
   
    @cart = session[:cart]
    
    #session.clear
    @subtotal = Cart.calculate_subtotal(@cart)
  end 

  def remove_cart_item
    product_id = params[:product_id]
    @cart = session[:cart]
    @cart.delete(product_id)
    redirect_to store_index_path
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
