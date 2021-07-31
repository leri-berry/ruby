# frozen_string_literal: true

class PassengerCarriage < Carriage
  CARRIAGE_TYPE = 'passenger'

  attr_accessor :number_seats, :occupied_seats, :free_seats, :type

  def initialize(number, options = {})
    super(number, CARRIAGE_TYPE)
    @number_seats = options[:number_seats]
    @free_seats = options[:number_seats]
    @occupied_seats = 0
  end

  def occupy_place
    @occupied_seats += 1
    @free_seats -= @occupied_seats
  end
end
