module MoveJokers
  
  def move_a_joker
    move(position_of_joker[:a], 1)
  end

  def move_b_joker
    move(position_of_joker[:b], 2)
  end
  
  private
  
  def move(index=0, position=0)
    moving_position = moving_position(index,position)
    moved_card = delete_at(index)
    insert(moving_position, moved_card)
    self
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