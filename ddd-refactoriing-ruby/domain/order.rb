
class Domain::Order
  attr_reader :customer, :items, :payment, :address, :closed_at, :status

   enum status: [
    :draft,
    :ordering,
    :payment,
    :processing_payment,
    :payment_accept,
    :delivery,
    :complete
  ]

  def initialize(customer, overrides = {})
    @customer = customer
    @items = []
    @order_item_class = overrides.fetch(:item_class) { OrderItem }
    @address = overrides.fetch(:address) { Address.new(zipcode: '45678-979') }
    @status = :draft
  end

  def add_product(product)
    @items << @order_item_class.new(order: self, product: product)
  end

  def total_amount
    @items.map(&:total).inject(:+)
  end

  def close(closed_at = Time.now)
    @closed_at = closed_at
  end

  def set_payment_accept
    if order.payment.pay?
      self.status = :payment_accept
      self.save
    end
  end

  def save
    raise NotImplementedError, ''    
  end
  
end