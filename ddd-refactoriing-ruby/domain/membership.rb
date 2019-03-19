class Domain::Membership
  attr_accessor :active
  attr_accessor :active_at
  attr_accessor :customer
  
  def initialize(customer)
    @customer = customer
  end
  
  def activate
    self.active = true
    self.active_at = Time.now
    self.save
  end
  
  def save
    #Save entity
  end
end
