require_relative '../cards_array'

describe CardsArray do
  let(:clubs) { 
    [
      stub(:is_the_a_joker? => false, :is_the_b_joker? => false)
    ]
  }
  let(:diamonds) {
    [
      stub(:is_the_a_joker? => false, :is_the_b_joker? => false)
    ]
  }
  let(:hearts) {
    [
      stub(:is_the_a_joker? => false, :is_the_b_joker? => false)
    ]
  }
  let(:spades) { 
    [
      stub(:is_the_a_joker? => false, :is_the_b_joker? => false)
    ]
  }
  let(:jokers) { 
    [
      stub(:is_the_a_joker? => true, :is_the_b_joker? => false),
      stub(:is_the_a_joker? => false, :is_the_b_joker? => true)
    ] 
  }
  let(:cards_array) { CardsArray.new(clubs, diamonds, hearts, spades, jokers) }

  describe "#initialize" do
    it "initializes" do
      cards_array
    end
  end
  
  describe "#move_a_joker" do
    subject { cards_array.move_a_joker }
    it "calls the move method for the a joker" do
      cards_array.should_receive(:move).with(4,1)
      subject
    end
  end
  
  describe "#move_b_joker" do
    subject { cards_array.move_b_joker }
    it "calls the move method for the b joker" do
      cards_array.should_receive(:move).with(5,2)
      subject
    end
  end
  
  describe "#move" do
    subject { cards_array.move(index,position) }
    let(:cards_array) { CardsArray.new(numbers, [], [], [],[]) }
    let(:numbers) { [1,2,3,4,5,6,7,8,9,10]}
    
    context 'move 1' do
      let(:index) { 8 }
      let(:position) { 1 }
      it "moves 9 by 1" do
        subject.should == [1,2,3,4,5,6,7,8,10,9]
      end
    end
    
    context 'move 2' do
      let(:index) { 8 }
      let(:position) { 2 }
      it "moves 9 by 2" do
        subject.should == [1,9,2,3,4,5,6,7,8,10]
      end
    end
  end
end