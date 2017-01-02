class Domain::Address
  attr_reader :zipcode

  def initialize(zipcode)
    @zipcode = zipcode
  end
  
  def save
    raise NotImplementedError, ''    
  end
  
end
