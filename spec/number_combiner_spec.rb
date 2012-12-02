require 'spec_helper'
require_relative '../number_combiner'

describe NumberCombiner do
  let(:num_group_1) {
    [
      [3, 15, 4, 5, 9],
      [14, 18, 21, 2, 25],
      [12, 9, 22, 5, 12],
      [15, 14, 7, 5, 18]
    ]
  }
  let(:num_group_2) {
    [
      [4, 23, 10, 24, 8],
      [25, 18, 6, 4, 7],
      [20, 13, 19, 8, 16],
      [21, 21, 18, 24, 10]
    ]
  }
  let(:number_combiner) { NumberCombiner.new(num_group_1, num_group_2) }

  describe "initialize" do
    it "initializes" do
      number_combiner
    end

    it { number_combiner.instance_variable_get("@numbers1").should == num_group_1 }
    it { number_combiner.instance_variable_get("@numbers2").should == num_group_2 }
    it { number_combiner.instance_variable_get("@result").should == [] }
  end

  describe "#combine" do
    subject { number_combiner.combine }
    it "combines the number groups and returns the result" do
      subject.should == [
        [7, 12, 14, 3, 17],
        [13, 10, 1, 6, 6],
        [6, 22, 15, 13, 2],
        [10, 9, 25, 3, 2]
      ]
    end
  end
end