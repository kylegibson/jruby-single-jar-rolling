require File.expand_path("spec_helper.rb", File.dirname(__FILE__))

describe NutWOW do
  it { should respond_to :listen }
  it { should respond_to :run }
  describe :listen do
    it "creates a server" do
      server = mock 'server'
      strategy = mock 'strategy'
      strategy.should_receive(:new).with({ :host => :foo, :port => :bar }).and_return server
      server.should_receive(:start).and_return :server
      subject.listen(strategy, :foo, :bar).should == :server
    end
  end
  describe :run do
    it { pending }
  end
end
