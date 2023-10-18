require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id, classroom, name = 'Unknown', age = 18, parent_permission: true)
    super(id, name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def add_classroom=(classroom)
    classroom.add_student(self)
  end
end
