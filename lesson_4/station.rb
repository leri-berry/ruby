class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
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