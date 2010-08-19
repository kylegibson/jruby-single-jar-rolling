require File.expand_path("spec_helper.rb", File.dirname(__FILE__))

describe StringTerminator do
  subject { described_class.new :dog }
  it { should be_a_kind_of Terminator }
  it { should respond_to :split_at }
  describe :terminator do
    specify { subject.terminator.should == :dog }
  end
  describe :found_in? do
    subject { described_class.new :term }
    it "checks whether the string is included" do
      buffer = mock 'buffer'
      buffer.should_receive(:include?).with(:term).and_return :yes
      subject.found_in?(buffer).should == :yes
    end
  end
  describe :split_at do
    subject { described_class.new ";" }
    context "when given a string" do
      specify { subject.split_at("this is ; a string").should == ["this is ;", " a string"] }
    end
  end
end
