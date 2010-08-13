require File.expand_path("spec_helper.rb", File.dirname(__FILE__))

describe Server do
  describe '#handle_accept' do

    before do
      @client_factory = mock 'client factory'
      @server = described_class.new @client_factory
    end

    subject { @server }

    context "when initialized" do
      it { should respond_to :handle_accept }
    end

    context "when accepting a connection" do
      before do
        subject.stub!(:accept).with(no_args()).and_return([:sock, :addr])
        @client_factory.stub!(:create)
      end

      it "calls accept" do
        subject.should_receive(:accept).with(no_args())
        subject.handle_accept
      end

      it 'creates a client' do
        @client_factory.should_receive(:create).with(:sock, :addr)
        subject.handle_accept
      end
    end

  end
end
