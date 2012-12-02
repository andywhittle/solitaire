require_relative 'move_jokers'
require_relative 'triple_cut'

module Solitaire
  include MoveJokers
  include TripleCut

  private

  def position_of_joker
    joker_positions = {}
    each_with_index do |card,index|
      joker_positions[:a] = index if card.is_the_a_joker?
      joker_positions[:b] = index if card.is_the_b_joker?
    end
    joker_positions
  end

  def max_length
    length - 1
  end
end