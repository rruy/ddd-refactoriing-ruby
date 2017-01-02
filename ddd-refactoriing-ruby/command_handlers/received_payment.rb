require 'domain/payment_product'
require 'domain/payment_product_book'
require 'domain/payment_product_digital'
require 'domain/payment_product_membership'
require 'domain/payment_product_physical'

class CommandHandlers::ReceivedPayment
            
      attr_accessor :order
      attr_accessor :payment
      attr_accessor :payment_product
            
      def initialize(payment)
        @order = payment.order
        @payment = payment
      end
              
      def execute
        if !@payment.paid? return
        order.order_item.each do |item|
          payment_product = "::Domain::PaymentProduct#{item.product.type}".constantize.new(payment_product).execute(order_item)
          payment_product.execute
        end
      end
end



        
