class Domain::PaymentProductDigital < Domain::PaymentProduct
        
    attr_accessor :order_item
        
    def type
        :"digital"
    end
       
    #Info:: Caso o pagamento seja de alguma mídia digital (música, vídeo), além de enviar a descrição da compra por e-mail ao comprador, 
    # conceder um voucher de desconto de R$ 10 ao comprador associado ao pagamento. 
    def execute(order_item)
       customer = order_item.order.customer
       message = "O pagamento do seu pedido #{order_item.order.id} foi aprovado!"
       
       Infrastructure::MailerService.send(customer.email, "", "Pagamento aprovado", message)
       
       Domain::Voucher.new(customer, 10).save
    end
end


