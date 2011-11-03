require "spec_helper"

describe Vehicle do
  it { should have_many(:tunes) }

  it "should expose name as #to_s" do
    described_class.new(:name => "Test").to_s.should == "Test"
  end

  it "should expose #resolve as find_by_name" do
    described_class.should_receive(:find_by_name).with("Test")
    described_class.resolve("Test")
  end

  it "should expose #[] as find_by_name" do
    described_class.should_receive(:find_by_name).with("Test")
    described_class["Test"]
  end
end

