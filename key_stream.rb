class KeyStream
  # the ord of A is 65 so to work out A-Z we had to subtract this number
  ORD_OFFSET = 64
  
  def initialize(message)
    @message = message
    @numbers = []
  end
  
  def convert
    @message.each_with_index do |grp,i|
      convert_group(grp,i)
    end
    @numbers
  end
  
  private
  
  def convert_group(msg, index)
    @numbers[index] = []
    msg.each_char do |char|
      @numbers[index] << to_ordinal(char)
    end
  end
  
  def to_ordinal(char)
    char.ord - ORD_OFFSET
  end
  
end