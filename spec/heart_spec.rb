require 'spec_helper'
require_relative '../heart'

describe Heart do
  let(:value) { 1 }
  let(:heart) { Heart.new(value)}
  
  describe "#initialize" do
    it "initializes" do
      heart
    end
  end
end
