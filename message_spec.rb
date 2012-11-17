require_relative 'message'

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
      message.stub(:split_into_groups => %w[CODEI NRUBY LIVEL ONGER ANXXX])
    end
    
    it { subject.should == "CODEI NRUBY LIVEL ONGER ANXXX"}
  end
  
  describe "#split_into_groups" do
    subject { message.split_into_groups }
    before do
      message.stub(:pad => "CODEINRUBYLIVELONGERANXXX")
    end
    
    it { subject.should == %w[CODEI NRUBY LIVEL ONGER ANXXX]}
  end
  
  describe "#group_count" do
    subject { message.group_count }
    before do
      message.stub(:pad => "CODEINRUBYLIVELONGERANXXX")
    end
    
    it { subject.should == 5 }
  end
  
  
  describe "#pad" do
    subject { message.pad }
    before do
      message.stub(:upcase => "TEST", :padding_string => "XXX")
    end
    
    it { subject.should == "TESTXXX"}
  end
  
  describe "#padding_string" do
    subject { message.padding_string }
    before do
      message.stub(:padding_factor => 4)
    end
    
    it { subject.should == "XXXX" }
  end
  
  describe "#padding_factor" do
    subject { message.padding_factor }
    context 'no padding' do
      before do
        message.stub(:upcase => "CODEINRUBYLIVELONGER")
      end

      it 'should return the amount of padding thats needed (multiple of 5)' do
        subject.should == 0
      end
    end

    context 'padding' do
      before do
        message.stub(:upcase => "CODEINRUBYLIVELON")
      end

      it 'should return the amount of padding thats needed (multiple of 5)' do
        subject.should == 3
      end
    end
  end
  
  describe "#padding_modulo" do
    subject { message.padding_modulo }
    context 'correct length' do
      before do
        message.stub(:upcase => stub(:length => 20))
      end
      
      it { subject.should == 0}
    end
    context 'needs padding' do
      before do
        message.stub(:upcase => stub(:length => 24))
      end
      
      it { subject.should == 4}
    end
  end
  
  describe "#upcase" do
    subject { message.upcase }
    before do
      message.stub(:remove_non_a_z_chars => "CodeinRubylivelonger")
    end

    it 'should upcase the message' do
      subject.should == "CODEINRUBYLIVELONGER"
    end
  end
  
  describe "#remove_non_a_z_chars" do
    subject { message.remove_non_a_z_chars }

    it 'should remove non a to z chars from the message' do
      subject.should == "CodeinRubylivelonger"
    end
  end

end