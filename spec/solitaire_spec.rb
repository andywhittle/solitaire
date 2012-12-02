require 'spec_helper'
require_relative '../solitaire'

describe Solitaire do
  class SolitaireDummyClass < Array
    include Solitaire
  end
  let(:dummy) { SolitaireDummyClass.new([card,jokera,card,jokerb]) }
  let(:card) { stub(:is_the_a_joker? => false, :is_the_b_joker? => false) }
  let(:jokera) { stub(:is_the_a_joker? => true, :is_the_b_joker? => false) }
  let(:jokerb) { stub(:is_the_a_joker? => false, :is_the_b_joker? => true) }

  describe "#position_of_joker" do
    subject { dummy.send(:position_of_joker) }

    context 'jokers found' do
      it "should return the positions of both jokers in the pack" do
        subject.should == {:a => 1, :b => 3}
      end
    end

    context "no jokers are found" do
      let(:jokera) { card }
      let(:jokerb) { card }

      it "should return nothing" do
        subject.should == {}
      end
    end
  end
  
  describe "#max_length" do
    subject { dummy.send(:max_length) }
    it "should return the length minus 1" do
      dummy.length.should == 4
      subject.should == 3
    end
  end
end