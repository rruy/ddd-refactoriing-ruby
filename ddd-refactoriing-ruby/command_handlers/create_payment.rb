require 'domain/payment'

class CommandHandler::CreatePayment
    class << self
        def execute(attributes)
          ::Domain::Payment.new(attributes).save
        end
    end
end