class Domain::OrderItem
  attr_reader :order, :product

  def initialize(order:, product:)
    @order = order
    @product = product
  end

  def total
    10
  end
  
  def save
    raise NotImplementedError, '' 
  end
  
end
