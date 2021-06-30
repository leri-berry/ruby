class CargoCarriage < Carriage
  CARRIAGE_TYPE = 'cargo'

  attr_accessor :capacity, :occupied_capacity, :free_capacity, :type

  def initialize(number, capacity)
  	@number = number
  	@type = CARRIAGE_TYPE
  	@capacity = capacity
  	@free_capacity = capacity
  	@occupied_capacity = 0
  end

  def occupy_capacity(size)
  	@occupied_capacity += size
  	@free_capacity -= occupied_capacity
  end
end