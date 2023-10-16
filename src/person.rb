require_relative 'nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(id, name = 'Unknown', age = 18, parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end
end
