class Domain::Voucher
  attr_accessor :customer
  attr_accessor :credit
    
  def initialize(customer, credit)
    @customer = customer
    @credit = credit
  end
    
  def save
    raise NotImplementedError, '' 
  end
end
