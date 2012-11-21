require_relative 'club'
require_relative 'diamond'
require_relative 'heart'
require_relative 'spade'
require_relative 'joker'
require_relative 'cards_array'

#collections of cards
class Deck
  
  def initialize
    @clubs = []
    @diamonds = []
    @hearts = []
    @spades = []
    @jokers = []
  end
  
  def cards
    @cards ||= build_cards
  end

  def shuffle!
    cards.shuffle!
  end
  
  private
  
  def build_cards
    build_suits
    build_jokers
    CardsArray.new(@clubs, @diamonds, @hearts, @spades, @jokers)
  end
  
  def build_suits
    (1..13).each do |value|
      @clubs << Club.new(value)
      @diamonds << Diamond.new(value)
      @hearts << Heart.new(value)
      @spades << Spade.new(value)
    end
  end

  def build_jokers
    %w[A B].each do |value|
      @jokers << Joker.new(value)
    end
  end
end