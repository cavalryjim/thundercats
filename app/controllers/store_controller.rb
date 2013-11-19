class StoreController < ApplicationController
  def index
  	@products = Product.all
  	@categories = Category.all

    if session[:cart].nil?
      session[:cart] = {}
    end
    @cart = session[:cart]
  end

  def add_cart
    product_id = params[:product_id]
    quantity = params[:quantity].to_i

    #this is a hash in a hash...
    if session[:cart].nil?
      session[:cart] = {}
    end

    current_cart = session[:cart]

    if current_cart[product_id].nil?
      current_cart[product_id] = quantity
    else
      old_quantity = current_cart[product_id]
      current_cart[product_id] = old_quantity + quantity
    end

    @cart = current_cart
    #to write to server log:
    Rails.logger.info "CART= #{session[:cart]}"

  end

  def show
  	@category = Category.new
  	@product = @category.product
  end
end
