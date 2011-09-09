require "spec_helper"

describe Concept do
  context "associations" do
    
  end
  
  context "validations" do
    it { should validate_presence_of(:name) }
  end
  
  it "should expose #resolve as find_by_name" do
    described_class.should_receive(:find_by_name).with("Drop 2").once
    described_class.resolve("Drop 2")
  end
end
