class Domain::PaymentProductMembership < Domain::PaymentProduct
        
  def type
    :"membership"
  end
        
  # Info: Caso o pagamento seja uma assinatura de serviço, você precisa ativar a assinatura, e notificar o usuário através de e-mail sobre isto;
  def execute(order_item)
    customer = order_item.order.customer
    message = " O seu pagamento do pedido #{order_item.order.id} foi aprovado e sua assinatura já está ativa! "
    Domain::Membership.new(customer).activate
    Infrastructure::MailerService.send(customer.email, "", "Pagamento aprovado", message)
  end
end
