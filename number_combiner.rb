class NumberCombiner
  MAX_NUMBER=26
  
  def initialize(numbers1, numbers2)
    @numbers1 = numbers1
    @numbers2 = numbers2
    @result = []
  end

  def combine
    (0..number_group_count).each do |index|
      combine_group(index)
    end
    @result
  end
  
  private 
  
  def combine_group(index)
    @result[index] = []
    (0..4).each do |i|
      @result[index] << combine_numbers(@numbers1[index][i], @numbers2[index][i])
    end
  end
  
  def combine_numbers(num1, num2)
    num = num1 + num2
    num -= MAX_NUMBER if num > MAX_NUMBER
    num
  end
  
  def number_group_count
    @numbers1.count - 1
  end
  
end