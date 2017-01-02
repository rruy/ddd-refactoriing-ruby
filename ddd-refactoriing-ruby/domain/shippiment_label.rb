class ShippimentLabel
    
    attr_accessor :label
    attr_accessor :order_item
    attr_accessor :address_shippiment
    
    def initialize(label, order_item, address_shippiment)
        @label = "label- #{order_item.id}"
        @order_item = order_item
        @address_shippiment = address_shippiment
        @notification = "Item Isento de imposto"
    end
    
    def save
      raise NotImplementedError, '' 
    end
    
end