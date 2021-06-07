class PassengerTrain < Train
  TRAIN_TYPE = 'passenger'

  def initialize(name, number)
    super(name, number, TRAIN_TYPE)
  end
end