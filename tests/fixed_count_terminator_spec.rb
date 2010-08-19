require File.expand_path("spec_helper.rb", File.dirname(__FILE__))

describe FixedCountTerminator do
  subject { described_class.new :cat }
  it { should be_a_kind_of Terminator }
  it { should respond_to :split_at }
  describe :terminator do
    specify { subject.terminator.should == :cat }
  end
  describe :found_in? do
    def found_in?(foo)
      subject.found_in?(foo)
    end
    subject { described_class.new 7 }
    context "when given nil" do
      specify { found_in?(nil).should be_false }
    end
    context "when given a number" do
      specify { found_in?("a"*6).should be_false } 
      specify { found_in?("b"*7).should be_true } 
      specify { found_in?("c"*10).should be_true } 
    end
  end
  describe :split_at do
    def split_at(foo)
      subject.split_at(foo)
    end
    subject { described_class.new 5 }
    context "when given nil" do
      specify { split_at(nil).should == ["", ""] }
    end
    context "when given a string" do
      specify { split_at("a"*6 + "b"*5).should == ["a"*5, "a" + "b"*5] }
    end
  end
end
