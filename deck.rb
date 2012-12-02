require_relative 'club'
require_relative 'diamond'
require_relative 'heart'
require_relative 'spade'
require_relative 'joker'
require_relative 'solitaire'

class Deck < Array
  include Solitaire

  def build
    build_clubs
    build_diamonds
    build_hearts
    build_spades
    build_jokers
    self
  end
  
  private

  def build_clubs
    (1..13).each do |value|
      push Club.new(value)
    end
  end

  def build_diamonds
    (1..13).each do |value|
      push Diamond.new(value)
    end
  end

  def build_hearts
    (1..13).each do |value|
      push Heart.new(value)
    end
  end

  def build_spades
    (1..13).each do |value|
      push Spade.new(value)
    end
  end

  def build_jokers
    %w[A B].each do |value|
      push Joker.new(value)
    end
  end

end