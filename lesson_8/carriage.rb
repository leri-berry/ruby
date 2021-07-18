# frozen_string_literal: true

require_relative 'company_name'
require_relative 'validator'

class Carriage
  attr_reader :number, :type

  include CompanyName
  include Validator

  def initialize(number, type)
    @number = number
    @type = type
  end
end
