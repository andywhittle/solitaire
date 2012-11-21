require_relative 'card'

class Joker < Card
  def full_name
    "#{value} of #{self.class}s"
  end
end