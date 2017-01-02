class Domain::PaymentProduct

   attr_accessor :order_item

   def type
       raise NotImplementedError, 'Implementated in the subclass'    
   end
        
   def execute(order_item)
       raise NotImplementedError, 'Implementated in the subclass'    
   end
   
end
    


