require 'spec_helper'
require_relative '../deck'

describe Deck do
  let(:deck) { Deck.new }
  describe "#initialize" do
    it 'initializes' do
      deck
    end
  end
  
  describe "#build" do
    subject { deck.build }
    it 'correctly builds the pack' do
      Club.should_receive(:new).exactly(13).times
      Diamond.should_receive(:new).exactly(13).times
      Heart.should_receive(:new).exactly(13).times
      Spade.should_receive(:new).exactly(13).times
      Joker.should_receive(:new).twice
      subject.size.should == 54
    end
    
  end
end
