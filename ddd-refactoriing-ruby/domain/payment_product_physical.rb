class Domain::PaymentProductPhysical < Domain::PaymentProduct
        
  def type
    :"physical"
  end
        
  #Info: Se o pagamento for para um item físico, você deverá gerar um shipping label para o mesmo ser colocado na caixa do envio;
  def execute(order_item)
    shipping_label = ShippimentLabel.new(order_item)
    shipping_label.save
    Cargo.new(order_item, shipping_label).save
  end
end

