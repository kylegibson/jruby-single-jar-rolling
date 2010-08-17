require File.expand_path("spec_helper.rb", File.dirname(__FILE__))

describe SimpleProducer do
  context "when initialized with no data" do
    subject { described_class.new "" }
    it "gives back an empty string" do
      subject.more.should be_empty
    end
  end
end
