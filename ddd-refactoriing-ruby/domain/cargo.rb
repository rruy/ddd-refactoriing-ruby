class Domain::Cargo
  attr_accessor :order_item
  attr_accessor :shipping_label
   
  def initialize(order_item, shipping_label)
    @order_item = order_item
    @shipping_label = shipping_label
  end
   
  def save
    raise NotImplementedError, ''    
  end
end
