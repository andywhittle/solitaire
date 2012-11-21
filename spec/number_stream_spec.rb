require_relative '../number_stream'

describe NumberStream do
  let(:numbers) { 
    [
      [20, 8, 5, 17, 21],
      [9, 3, 11, 2, 18],
      [15, 23, 14, 6, 15],
      [24, 10, 21, 13, 16],
      [19, 15, 22, 5, 18],
      [20, 8, 5, 12, 1],
      [26, 25, 4, 15, 7]
    ]
  }
  let(:number_stream) { NumberStream.new(numbers) }
  
  describe "#initialize" do
    subject { number_stream }
    it "initializes" do
      subject
    end
    
    it { subject.instance_variable_get("@numbers").should == numbers }
    it { subject.instance_variable_get("@message").should == []}
  end
  
  describe "#convert" do
    subject { number_stream.convert }
    it "converts the example message to number equivalent" do
      subject.should == ["THEQU", "ICKBR", "OWNFO", "XJUMP", "SOVER", "THELA", "ZYDOG"]
    end
  end
end