class CargoCarriage < Carriage
  CARRIAGE_TYPE = 'cargo'

  def initialize(number)
    super(number, CARRIAGE_TYPE)
  end
end