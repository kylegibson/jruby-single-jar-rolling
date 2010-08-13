require File.expand_path("spec_helper.rb", File.dirname(__FILE__))

describe Nutwow do
  describe :boot do
    context "when acting as a client" do
      subject { described_class.new :client }
      it { should_not be_nil }
    end

    context "when acting as a server" do
      subject { described_class.new :server }
      it { should_not be_nil }
    end
  end
end
