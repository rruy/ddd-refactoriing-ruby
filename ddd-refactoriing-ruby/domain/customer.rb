class Domain::Customer
  attr_accessor :id, :name
  
  def initialize(id, name)
    @id = id
    @name = name
  end
 
  def save
    raise NotImplementedError, ''    
  end
end
