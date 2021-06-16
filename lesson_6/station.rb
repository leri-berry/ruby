require_relative 'instance_counter'
require_relative 'validator'

class Station
  attr_reader :name, :trains

  include InstanceCounter
  include Validator

  @@instances = []

  def self.all
    @@instances
  end

  def initialize(name)
    @name = name
    @trains = []
    @@instances << self
    register_instance
    validate!
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

  protected

  def validate!
    raise 'Name can not be nil' if name.empty?
  end
end