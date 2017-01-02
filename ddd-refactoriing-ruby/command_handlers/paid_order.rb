class CommandHandler::PaidOrder
    
    attr_accessor :payment
    
    class << self
        def execute(payment)
            @payment = payment
            @payment.pay
            payment.order.set_payment_accept
            CommandHandlers::ReceivedPayment.new(payment).execute
        end
    end
end