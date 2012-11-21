class NumberStream
  # the ord of A is 65 so to work out A-Z we had to subtract this number
  ORD_OFFSET = 64
  
  def initialize(numbers)
    @numbers = numbers
    @message = []
  end
  
  def convert
    @numbers.each_with_index do |number_grp,i|
      convert_group(number_grp,i)
    end
    @message
  end
  
  private
  
  def convert_group(numbers, index)
    @message[index] = ""
    numbers.each do |num|
      @message[index] << from_ordinal(num)
    end
  end
  
  def from_ordinal(num)
    (num + ORD_OFFSET).chr
  end
end