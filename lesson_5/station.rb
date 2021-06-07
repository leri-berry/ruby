require_relative 'instance_counter'

class Station
  attr_reader :name, :trains

  include InstanceCounter

  @@instances = []

  def self.all
    @@instances
  end

  def initialize(name)
    @name = name
    @trains = []
    @@instances << self
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
end