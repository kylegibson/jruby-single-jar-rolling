require File.expand_path("spec_helper.rb", File.dirname(__FILE__))

include Socket::Constants

describe Socket do
  subject { described_class.new AF_INET, SOCK_STREAM, 0 }
  describe '#reuse_bind_address' do
    it { should respond_to :reuse_bind_address }
    it "sets the correct socket option" do
      subject.should_receive(:setsockopt).with(SOL_SOCKET, SO_REUSEADDR, :foo).and_return :bar
      subject.reuse_bind_address(:foo).should == :bar
    end
  end
end
