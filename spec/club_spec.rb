require 'spec_helper'
require_relative '../club'

describe Club do
  let(:value) { 1 }
  let(:club) { Club.new(value)}
  
  describe "#initialize" do
    it "initializes" do
      club
    end
  end
end
