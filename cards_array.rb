class CardsArray < Array

  def initialize(clubs,diamonds,hearts,spades,jokers)
    @joker_positions = {}
    super([clubs, diamonds, hearts, spades, jokers].flatten)
  end

  def move_a_joker
    move(position_of_joker[:a], 1)
  end

  def move_b_joker
    move(position_of_joker[:b], 2)
  end

  def move(index=0, position=0)
    moving_position = moving_position(index,position)
    moved_card = delete_at(index)
    insert(moving_position, moved_card)
    self
  end
  
  def triple_cut
    unshift(*last_cut)
    push(*first_cut)
  end
  
  private

  def first_cut
    slice!(0..first_joker_position-1) if first_joker_position > 0
  end
  
  def last_cut
    slice!(last_joker_position..max_length) if last_joker_position < max_length
  end
  
  def first_joker_position
    joker_positions.first
  end
  
  def last_joker_position
    joker_positions.last
  end
  
  def joker_positions
    position_of_joker.values.sort
  end
  
  def position_of_joker
    each_with_index do |card,index|
      @joker_positions[:a] = index if card.is_the_a_joker?
      @joker_positions[:b] = index if card.is_the_b_joker?
    end
    @joker_positions
  end
  
  def moving_position(index,position)
    new_position = index+position
    new_position -= max_length if new_position > max_length
    new_position
  end
  
  def max_length
    length - 1
  end
  
end