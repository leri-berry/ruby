# frozen_string_literal: true

require_relative 'validation'
require_relative 'train'
require_relative 'route'
require_relative 'station'
require_relative 'carriage'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'accessors'

class Main
  def initialize
    @trains = []
    @routes = []
    @stations = []
  end

  def menu
    loop do
      puts '1 - создать станцию'
      puts '2 - создать поезд'
      puts '3 - создать маршрут'
      puts '4 - управлять станциями маршрута'
      puts '5 - назначать маршрут поезду'
      puts '6 - добавить вагоны поезду'
      puts '7 - отцепить вагоны поезда'
      puts '8 - переместить поезд по маршруту'
      puts '9 - просмотреть список станций и список поездов на станции'
      puts '10 - просмотреть вагоны поездов'
      puts '11 - просмотреть список поездов на станции'
      puts '12 - занимать место или объем'
      puts '0 - закрыть программу'

      choice = gets.to_i

      case choice
      when 1 then create_station
      when 2 then create_train
      when 3 then create_route
      when 4 then manage_route
      when 5 then set_route
      when 6 then add_carriage
      when 7 then delete_carriage
      when 8 then move_train
      when 9 then see_stations_and_trains_on_station
      when 10 then see_trains_carriages
      when 11 then see_station_trains
      when 12 then occupy_place_or_capacity
      when 0 then break
      end
    end
  end

  def create_train
    puts 'Выберите тип поезда: 1 - пассажирский, 2 - грузовой'
    train = gets.chomp.to_i
    case train
    when 1
      train = create_passenger_train
    when 2
      train = create_cargo_train
    end
    @trains << train
    puts "Поезд #{train.number} создан" if train.valid?
  rescue RuntimeError => e
    puts "Поезд не создан , #{e.message}"
    retry
  end

  def create_station
    puts 'Введите название станции'
    name = gets.chomp
    station = Station.new(name)
    @stations << station
    puts "Станция #{station.name} создана"
  end

  def create_route
    first_station = choose_station
    last_station = choose_station
    @routes << Route.new(first_station, last_station)
    puts "Маршрут #{first_station.name} - #{last_station.name} создан"
  end

  def manage_route
    route = choose_route
    puts 'Добавить станцию выберете - 1, Удалить станцию выберете - 2'
    choice = gets.chomp.to_i
    case choice
    when 1
      puts 'Введите название станции для добавления в маршрут'
      station = choose_station
      route.add_stations(station)
      puts "#{station.name} добавлена"
    when 2
      puts 'Введите название станции для удаления из маршрута'
      station = choose_station
      route.delete_station(station)
      puts "#{station.name} удалена"
    end
  end

  def set_route
    route = choose_route
    train = choose_train
    train.set_route(route)
  end

  def add_carriage
    train = choose_train
    case train.type
    when 'cargo'
      carriage = create_cargo_carriage
    when 'passenger'
      carriage = create_passenger_carriage
    end
    train.add_carriage(carriage)
  end

  def delete_carriage
    train = choose_train
    carriage = train.carriages[-1]
    train.remove_carriage(carriage)
  end

  def move_train
    train = choose_train
    puts 'Выберете направление движения поезда: 1 - вперед, 2 - назад'
    choice = gets.chomp.to_i
    case choice
    when 1
      train.moving_next_station
    when 2
      train.moving_previous_station
    end
    puts "Текущая станция #{train.current_station.name}"
  end

  def see_stations_and_trains_on_station
    station = choose_station
    station.trains.each { |train| puts train.name }
  end

  def see_trains_carriages
    @trains.each(&:list_carriages)
  end

  def see_station_trains
    @stations.each(&:list_trains)
  end

  def occupy_place_or_capacity
    selected_carriage = choose_carriage(choose_train)
    carriage = selected_carriage.last
    case carriage.type
    when 'cargo'
      size = gets.chomp.to_i
      carriage.occupy_capacity(size)
    when 'passenger'
      carriage.occupy_place
    end
  end

  protected # methods must be accessible to other methods of the class

  def all_routes
    @routes.each.with_index(1) do |route, index|
      puts "#{index}: #{route.stations.first.name} - #{route.stations.last.name}"
    end
  end

  def all_stations
    @stations.each.with_index(1) do |station, index|
      puts "#{index} - #{station.name}"
    end
  end

  def all_trains
    @trains.each.with_index(1) do |train, index|
      puts "#{index} - #{train.name}"
    end
  end

  def choose_train
    puts 'Укажите поезд'
    all_trains
    choice_train = gets.chomp.to_i
    @trains[choice_train - 1]
  end

  def choose_route
    puts 'Выберете маршрут'
    all_routes
    choice_route = gets.chomp.to_i
    @routes[choice_route - 1]
  end

  def choose_station
    puts 'Выберете станцию'
    all_stations
    choice_station = gets.chomp.to_i
    @stations[choice_station - 1]
  end

  def choose_carriage(train)
    train.carriages.each.with_index(1) do |carriage, index|
      puts "#{index} - #{carriage.number}"
      carriage_index = gets.chomp.to_i
      train.carriages[carriage_index - 1]
    end
  end

  def create_passenger_train
    puts 'Введите имя поезда'
    name = gets.chomp
    puts 'Введите номер поезда'
    number = gets.chomp
    PassengerTrain.new(name, number)
  end

  def create_cargo_train
    puts 'Введите имя поезда'
    name = gets.chomp
    puts 'Введите номер поезда'
    number = gets.chomp
    CargoTrain.new(name, number)
  end

  def create_passenger_carriage
    puts 'Укажите номер вагона'
    number = gets.chomp.to_i
    puts 'Укажите кол-во мест'
    number_seats = gets.chomp.to_i
    PassengerCarriage.new(number, number_seats: number_seats)
  end

  def create_cargo_carriage
    puts 'Укажите номер вагона'
    number = gets.chomp.to_i
    puts 'Укажите объем вагона'
    capacity = gets.chomp.to_i
    CargoCarriage.new(number, capacity: capacity)
  end
end

Main.new.menu
