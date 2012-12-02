require 'spec_helper'
require_relative '../message'

describe Message do
  let(:msg) { "Code in Ruby, live longer!"}
  let(:message) { Message.new(msg)}

  describe "#new" do
    it 'instantiates a new message' do
      message
    end

    it 'sets the message instance variable' do
      message.instance_variable_get("@message").should == msg
    end
  end

  describe "#plaintext" do
    subject { message.plaintext }
    before do
      message.stub(:groups => %w[CODEI NRUBY LIVEL ONGER ANXXX])
    end
    it { subject.should == "CODEI NRUBY LIVEL ONGER ANXXX"}
  end
  
  describe "#groups" do
    subject { message.groups }
    context 'modulo 5' do
      it { subject.should == %w[CODEI NRUBY LIVEL ONGER]}
    end

    context 'with 1 padding' do
      let(:msg) { "Code in Ruby, live longer!ruby"}
      it { subject.should == %w[CODEI NRUBY LIVEL ONGER RUBYX]}
    end
    
    context 'with 2 padding' do
      let(:msg) { "Code in Ruby, live longer!rub"}
      it { subject.should == %w[CODEI NRUBY LIVEL ONGER RUBXX]}
    end

    context 'with 3 padding' do
      let(:msg) { "Code in Ruby, live longer!ru"}
      it { subject.should == %w[CODEI NRUBY LIVEL ONGER RUXXX]}
    end
    
    context 'with 4 padding' do
      let(:msg) { "Code in Ruby, live longer!r"}
      it { subject.should == %w[CODEI NRUBY LIVEL ONGER RXXXX]}
    end
    
    context 'small message' do
      let(:msg) { "a" }
      it { subject.should == %w[AXXXX]}
    end
    
    context 'blank message' do
      let(:msg) { "" }
      it { subject.should == %w[]}
    end
  end
  
end