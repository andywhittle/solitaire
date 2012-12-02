require 'spec_helper'
require_relative '../joker'

describe Joker do
  let(:value) { 'A' }
  let(:joker) { Joker.new(value)}
  
  describe "#initialize" do
    it "initializes" do
      joker
    end
  end
  
  describe "#full_name" do
    subject { joker.full_name }
    it "returns the full name of the joker" do
      subject.should == "A of Jokers"
    end
  end
end
