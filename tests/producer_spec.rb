require File.expand_path("spec_helper.rb", File.dirname(__FILE__))

describe Producer do
  it "does not implement :more" do
    lambda { subject.more }.should raise_error
  end
end
