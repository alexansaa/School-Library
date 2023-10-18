require_relative 'person'

class Teacher < Person
  def initialize(id, specialization, name = 'Unknown', age = 18, parent_permission: true)
    super(id, name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def description
    return "[Teacher] Name: #{self.name}, ID: #{self.id}, Age: #{self.age}"
  end
end
