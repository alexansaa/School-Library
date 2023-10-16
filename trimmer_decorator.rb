require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable[0..9]
  end
end
