class Message
  GROUP_LENGTH=5
  
  def initialize(message)
    @message = message
  end
  
  def plaintext
    split_into_groups.join(" ")
  end
  
  def split_into_groups
    @groups = []
    group_count.times do |grp|
      start = grp * GROUP_LENGTH
      @groups << pad.slice(start, GROUP_LENGTH)
    end
    @groups
  end
  
  def group_count
    (pad.length / GROUP_LENGTH).floor
  end
  
  def pad
    @pad ||= upcase + padding_string
  end
  
  def padding_string
    "X" * padding_factor
  end
  
  def padding_factor
    return 0 if padding_modulo == 0
    GROUP_LENGTH - padding_modulo
  end
  
  def padding_modulo
    upcase.length % GROUP_LENGTH
  end
  
  def upcase
    remove_non_a_z_chars.upcase
  end
  
  def remove_non_a_z_chars
    @message.gsub(/[^a-zA-Z]/,'')
  end
  
end