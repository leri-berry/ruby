class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def get_trains(train)
    @trains << train
  end

  def show_trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def send_train(train)
    puts 'The train was gone'
    @trains.delete(train)
  end
  
end