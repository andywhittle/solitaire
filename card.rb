class Card
  attr_accessor :value
  
  SPECIAL_NAMES = {
    1 => "Ace",
    11 => "Jack",
    12 => "Queen",
    13 => "King",
    'A' => "The_A_Joker",
    'B' => "The_B_Joker"
  }
  
  SPECIAL_NAMES.each do |number,special|
    method_name = ("is_#{special.downcase}?").to_sym
    send :define_method, method_name do
      value == number
    end
  end
  
  def initialize(value)
    @value = value
  end

  def name
    special_name || value
  end
  
  def full_name
    "#{name} of #{self.class}s"
  end
  
  private
  
  def special_name
    SPECIAL_NAMES[value]
  end
  
end