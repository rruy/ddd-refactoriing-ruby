
class Domain::Customer
  # you can customize this class by yourself
  
  attr_accessor :id, :name
  
  def initialize(id, name)
    @id = id
    @name = name
  end
 
  def save
    raise NotImplementedError, ''    
  end
 
end