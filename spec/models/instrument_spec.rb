require "spec_helper"

describe Instrument do
  context "associations" do
    it { should have_many(:musicians) }
  end
  
  context "validations" do
    it { should validate_presence_of(:name) }
  end
  
  it "should expose #to_s as name" do
    described_class.new(:name => "Test").to_s.should == "Test"
  end
  
  it "should expose #resolve as find_by_name" do
    described_class.should_receive(:find_by_name).with("Trumpet").once
    described_class.resolve("Trumpet")
  end
end
