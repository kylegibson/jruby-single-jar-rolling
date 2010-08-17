require File.expand_path("spec_helper.rb", File.dirname(__FILE__))

describe Producer do
  it "doesn't have more" do
    lambda { subject.more }.should raise_error
  end
end
