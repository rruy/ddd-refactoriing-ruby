require 'domain/customer'

class CommandHandler::CreateCustomer
    class << self
        def execute(attributes)
           ::Domain::Customer.new(attributes).save
        end
    end
end