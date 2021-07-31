# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(name, validation_type, *arg)
      @validations ||= []
      @validations << { name: name, type: validation_type, arg: arg }
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    protected

    def validate!
      self.class.validations.each do |params|
        value = instance_variable_get(params[:name])
        send("validate_#{params[:validatin_type]}", value, *params[:arg])
      end
    end

    def validate_presence(value)
      raise 'Can not be empty' if value.empty?
    end

    def validate_format(value, format)
      raise 'Wrong format' if value !~ format
    end

    def validate_type(value, attribute_class)
      raise 'Object does not match class' unless value.is_a?(attribute_class)
    end
  end
end
