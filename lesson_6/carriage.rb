require_relative 'company_name'
require_relative 'validator'

class Carriage
  attr_reader :number, :type

  include CompanyName
  include Validator

  
  def initialize(number, type)
    @number = number
    @type = type
    validate!
  end

  def validate!
  	raise 'Number can not be nil' if number.empty?
  	raise 'Type can not be nil' if type.empty?
  end
end