class Domain::PaymentProductBook < Domain::PaymentProduct
    
    attr_accessor :order_item
        
    def type
      :"book"
    end
        
    # Caso o pagamento seja um livro comum, você precisa gerar o shipping label com uma notificação de que trata-se de um item isento de impostos 
    # conforme disposto na Constituição Art. 150, VI, d.
    def execute(order_item)
        Domain::ShippimentLabel.new(order_item).save
        
        customer = order_item.order.customer
        message = "Seu pagamento do pedido #{order_item.order.id} foi aprovado - O livro #{order_item.product.name} que você comprou é isento de impostos"
        
        Infrastructure::MailerService.send(customer.email, "", "Pagamento aprovado", message)
    end
                
end


