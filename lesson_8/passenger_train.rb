# frozen_string_literal: true

class PassengerTrain < Train
  TRAIN_TYPE_PASSENGER = 'passenger'

  def initialize(name, number)
    super(name, number, TRAIN_TYPE_PASSENGER)
  end
end
