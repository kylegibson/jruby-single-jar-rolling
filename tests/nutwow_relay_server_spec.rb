require File.expand_path("spec_helper.rb", File.dirname(__FILE__))

describe NutWOWRelayServer do
  subject { described_class.new :host => :foo, :port => :bar }
  specify { subject.should be_a_kind_of Socket }
  it { should respond_to :start }
  it { should respond_to :reuse_bind_address }
  describe :start do
    it "starts" do
      subject.should_receive(:reuse_bind_address).with(true)
      addr = mock 'address'
      Socket.should_receive(:pack_sockaddr_in).with(:bar, :foo).and_return addr
      subject.should_receive(:bind).with(addr)
      subject.should_receive(:listen).with(5).and_return :foo
      subject.start.should == :foo
    end
  end
end
