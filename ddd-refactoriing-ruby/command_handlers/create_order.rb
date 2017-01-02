require 'domain/order'

class CommandHandler::CreateOrder
    class << self
        def execute(attributes)
           ::Domain::Order.new(attributes).save
        end
    end
end