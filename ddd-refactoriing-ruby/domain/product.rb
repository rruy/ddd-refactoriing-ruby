
class Domain::Product
  # use type to distinguish each kind of product: physical, book, digital, membership, etc.
  attr_reader :name, :type

  def initialize(name, type)
    @name = name
    @type = type
  end
  
  def save
    raise NotImplementedError, '' 
  end
end

