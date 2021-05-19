class PassengerCarriage < Carriage
  CARRIAGE_TYPE = 'passenger'

  def initialize(number)
    super(number, CARRIAGE_TYPE)
  end
end