require File.expand_path("spec_helper.rb", File.dirname(__FILE__))

describe Server do
  it '#handle_accept' do
    subject.should_receive(:accept)
    subject.handle_accept
  end
end
