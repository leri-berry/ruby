# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Station
  attr_reader :name, :trains

  include InstanceCounter
  include Validation

  validate :name, :presence

  @instances = []

  def self.all
    @@instances
  end

  def initialize(name)
    @name = name
    @trains = []
    @instances << self
    register_instance
  end

  def get_trains(train)
    @trains << train
  end

  def show_trains
    @trains.each { |train| puts train.name }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def list_trains
    block = ->(train) { puts train.number, train.type, train.carriages.size }
    @trains.each { |train| block.call(train) }
  end
end
