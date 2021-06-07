require_relative 'company_name'

class Carriage
  attr_reader :number, :type

  include CompanyName
  
  def initialize(number, type)
    @number = number
    @type = type
  end
end