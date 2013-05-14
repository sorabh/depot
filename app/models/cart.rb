class Cart < ActiveRecord::Base
  attr_accessible :line_items
  has_many :line_items, :dependent => :destroy
  def add_product(product_id, product_price)
    @product = Product.find(product_id).dup
    current_item = line_items.where(:product_id => product_id).first
    if current_item
      puts "from cart if"
      current_item.quantity += 1
      current_item.price = @product.price
    else
      current_item = LineItem.new(:product_id => product_id, :price => @product.price)
      line_items << current_item
    end
    current_item
  end
  # attr_accessible :title, :body
  def total_price
    line_items.to_a.sum{|items| items.total_price}
  end
end
