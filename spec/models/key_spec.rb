require "spec_helper"

describe Key do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:index) }
    it { should validate_presence_of(:letter_index) }
    it { should validate_presence_of(:cycle_index) }
  end
  
  it "should expose #to_s as name"
  
  it "should expose #default as the key of C" do
    pending "need seeds" do
      described_class.default.name.should == "C"
    end
  end
  
  it "should expose primary keys around the cycle" do
    pending "needs seeds" do
      described_class.primaries.should =~ ["C", "F", "Bb", "Eb", "Ab", "Db", "Gb", "B", "E", "A", "D", "G"]
    end
  end
  
  describe "#enharmonic_with?" do
    
  end
  
  describe "deindexing" do
    
  end
  
  describe "hash access" do
    it "should look up by name"
    it "should look up by index"
  end
end
