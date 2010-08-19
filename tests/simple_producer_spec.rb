require File.expand_path("spec_helper.rb", File.dirname(__FILE__))

describe SimpleProducer do
  describe :more do
    context "with no data" do
      subject { described_class.new "" }
      specify { subject.more.should be_empty }
    end
    context "with some data" do
      subject { described_class.new "a" * 10 + "b" * 5, 5 }
      it "gives back the correct chunk of data after each call" do
        subject.more.should == "a" * 5 
        subject.more.should == "a" * 5 
        subject.more.should == "b" * 5 
        subject.more.should be_empty
      end
    end
  end
end
