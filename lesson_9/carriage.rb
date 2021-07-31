# frozen_string_literal: true

require_relative 'company_name'
require_relative 'validation'

class Carriage
  attr_reader :number, :type

  include CompanyName
  include Validation

  validate :number, :presence

  def initialize(number, type)
    @number = number
    @type = type
  end
end
