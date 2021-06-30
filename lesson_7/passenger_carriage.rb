class PassengerCarriage < Carriage
  CARRIAGE_TYPE = 'passenger'

  attr_accessor :number_seats, :occupied_seats, :free_seats, :type

  def initialize(number, number_seats)
  	@number = number
  	@number_seats = number_seats
  	@type = CARRIAGE_TYPE
  	@occupied_seats = 0
  	@free_seats = number_seats
  end

  def occupy_place
  	@occupied_seats += 1
  	@free_seats -= @occupied_seats
  end
end