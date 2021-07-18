# frozen_string_literal: true

class CargoTrain < Train
  TRAIN_TYPE_CARGO = 'cargo'

  def initialize(name, number)
    super(name, number, TRAIN_TYPE_CARGO)
  end
end
