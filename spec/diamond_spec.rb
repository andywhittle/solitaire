require 'spec_helper'
require_relative '../diamond'

describe Diamond do
  let(:value) { 1 }
  let(:diamond) { Diamond.new(value)}
  
  describe "#initialize" do
    it "initializes" do
      diamond
    end
  end
end
