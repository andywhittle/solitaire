require 'spec_helper'
require_relative '../triple_cut'

describe TripleCut do
  class TripleCutDummyClass
    include TripleCut
  end
  let(:dummy) { TripleCutDummyClass.new }
  let(:position_a) { 1 }
  let(:position_b) { 3 }
  let(:joker_positions) { {:a => position_a, :b => position_b} }
  
  before do
    dummy.stub(:position_of_joker => joker_positions)
    dummy.stub(:length => 5)
  end
  
  describe "cut" do
    subject { dummy.cut }
    context "jokers are in middle of pack" do
      it 'triple cuts the deck' do
        dummy.should_receive(:unshift).with(4,5)
        dummy.should_receive(:push).with(1)
        dummy.should_receive(:slice!).with(4..5).and_return([4,5])
        dummy.should_receive(:slice!).with(0..0).and_return([1])
        subject
      end
    end
    context "one joker is first" do
      let(:position_a) { 0 }
      it 'triple cuts the deck' do
        dummy.should_receive(:unshift).with(4,5)
        dummy.should_receive(:push).with()
        dummy.should_receive(:slice!).with(4..5).and_return([4,5])
        subject
      end
    end
    context "one joker is last" do
      let(:position_b) { 5 }
      it 'triple cuts the deck' do
        dummy.should_receive(:unshift).with()
        dummy.should_receive(:push).with(1)
        dummy.should_receive(:slice!).with(0..0).and_return([1])
        subject
      end
    end
  end
end