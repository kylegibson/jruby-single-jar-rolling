require File.expand_path("spec_helper.rb", File.dirname(__FILE__))

describe Terminator do
  it { should respond_to :found_in? }
  it { should respond_to :terminator }
  it { should respond_to :terminator= }
  it "does not implement :found_in?" do
    lambda { subject.found_in? }.should raise_error
  end
  describe :terminator do
    subject { described_class.new :foo }
    context "when initialized" do
      it { subject.terminator.should == :foo }
    end
    context "when modified" do
      before { subject.terminator = :amazing } 
      it { subject.terminator.should == :amazing }
    end
  end
end
