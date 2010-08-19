require File.expand_path("spec_helper.rb", File.dirname(__FILE__))

describe NilTerminator do
  subject { described_class.new :foo }
  it { should be_a_kind_of Terminator }
  it { should respond_to :split_at }
  describe :terminator do
    it { subject.terminator.should == :foo }
  end
  describe :split_at do
    it { subject.split_at(:bar).should == ["", :bar] }
  end
end
