require 'spec_helper'
require_relative '../key_stream'

describe KeyStream do
  let(:message) { ["THEQU", "ICKBR", "OWNFO", "XJUMP", "SOVER", "THELA", "ZYDOG"] }
  let(:key_stream) { KeyStream.new(message) }
  
  describe "#initialize" do
    subject { key_stream }
    it "initializes" do
      subject
    end
    
    it { subject.instance_variable_get("@message").should == message }
    it { subject.instance_variable_get("@numbers").should == []}
  end
  
  describe "#convert" do
    subject { key_stream.convert }
    it "converts the example message to number equivalent" do
      subject.should == [
        [20, 8, 5, 17, 21],
        [9, 3, 11, 2, 18],
        [15, 23, 14, 6, 15],
        [24, 10, 21, 13, 16],
        [19, 15, 22, 5, 18],
        [20, 8, 5, 12, 1],
        [26, 25, 4, 15, 7]
      ]
    end
  end
end