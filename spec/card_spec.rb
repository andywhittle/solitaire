require_relative '../card'

describe Card do
  let(:value) { 1 }
  let(:card) { Card.new(value)}

  describe '#initialize' do
    it 'initializes' do
      card
    end
    
    it 'assigns the value' do
      card.instance_variable_get("@value").should == value
    end
  end
  
  describe "#is_ace?" do
    subject { card.is_ace? }
    context "when true" do
      before do
        card.stub(:value => 1)
      end
    
      it 'is true' do
        subject.should be_true
      end
    end
    
    context "when false" do
      before do
        card.stub(:value => 2)
      end
    
      it 'is false' do
        subject.should be_false
      end
    end
  end
  
  describe "#is_jack?" do
    subject { card.is_jack? }
    context "when true" do
      before do
        card.stub(:value => 11)
      end
    
      it 'is true' do
        subject.should be_true
      end
    end
    
    context "when false" do
      before do
        card.stub(:value => 1)
      end
    
      it 'is false' do
        subject.should be_false
      end
    end
  end
  
  describe "#is_queen?" do
    subject { card.is_queen? }
    context "when true" do
      before do
        card.stub(:value => 12)
      end
    
      it 'is true' do
        subject.should be_true
      end
    end
    
    context "when false" do
      before do
        card.stub(:value => 1)
      end
    
      it 'is false' do
        subject.should be_false
      end
    end
  end
  
  describe "#is_king?" do
    subject { card.is_king? }
    context "when true" do
      before do
        card.stub(:value => 13)
      end
    
      it 'is true' do
        subject.should be_true
      end
    end
    
    context "when false" do
      before do
        card.stub(:value => 1)
      end
    
      it 'is false' do
        subject.should be_false
      end
    end
  end
  
  describe "#name" do
    subject { card.name }
    
    context 'special' do
      it { subject.should == "Ace" }
    end
    
    context 'not special' do
      let(:value) { 2 }
      it { subject.should == 2 }
    end
  end
  
  describe "#full_name" do
    subject { card.full_name }
    it { subject.should == "Ace of Cards"}
  end
end