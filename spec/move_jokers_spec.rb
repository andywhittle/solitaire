require 'spec_helper'
require_relative '../move_jokers'

describe MoveJokers do
  class DummyClass
    include MoveJokers
  end
  let(:dummy) { DummyClass.new }
  let(:joker) { stub }
  before do
    dummy.stub(:position_of_joker => {:a => 1, :b => 2})
    dummy.stub(:length => 5)
  end
  
  describe "#move_a_joker" do
    subject { dummy.move_a_joker }
    it "moves the a joker by 1 place" do
      dummy.should_receive(:delete_at).with(1).and_return(joker)
      dummy.should_receive(:insert).with(2, joker)
      subject
    end
  end
  
  describe "#move_b_joker" do
    subject { dummy.move_b_joker }
    it "moves the a joker by 1 place" do
      dummy.should_receive(:delete_at).with(2).and_return(joker)
      dummy.should_receive(:insert).with(4, joker)
      subject
    end
  end
end