require_relative '../spade'

describe Spade do
  let(:value) { 1 }
  let(:spade) { Spade.new(value)}
  
  describe "#initialize" do
    it "initializes" do
      spade
    end
  end
end
