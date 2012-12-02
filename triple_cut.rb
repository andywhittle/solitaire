module TripleCut
  
  def cut
    first = first_cut
    last = last_cut
    unshift(*last)
    push(*first)
  end
  
  private
  
  def first_cut
    slice!(0..first_joker_position-1) if first_joker_position > 0
  end
  
  def last_cut
    slice!(last_joker_position+1..length) if last_joker_position < length
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
  
end