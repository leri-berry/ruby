class CargoTrain < Train
  TRAIN_TYPE = 'cargo'

  def initialize(name, number)
    super(name, number, TRAIN_TYPE)
  end
end