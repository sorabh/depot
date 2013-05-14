class StoreController < ApplicationController
  def increment_count
    if session[:counter].nil?
      session[:counter] = 0
    end
    session[:counter] += 1
  end
  def index
    @products = Product.all
    @count = increment_count
    @cart = current_cart

  end
end
