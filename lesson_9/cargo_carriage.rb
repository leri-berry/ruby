# frozen_string_literal: true

class CargoCarriage < Carriage
  CARRIAGE_TYPE = 'cargo'

  attr_accessor :capacity, :occupied_capacity, :free_capacity, :type

  def initialize(number, options = {})
    super(number, CARRIAGE_TYPE)
    @capacity = options[:capacity]
    @free_capacity = options[:capacity]
    @occupied_capacity = 0
  end

  def occupy_capacity(size)
    @occupied_capacity += size
    @free_capacity -= occupied_capacity
  end
end
