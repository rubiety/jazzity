require "spec_helper"

describe ChordTone do
  describe "associations" do
    it { should belong_to(:chord) }
  end
  
  describe "delegations" do
    it "should delegate key to chord"
  end
  
  describe "validations" do
    it { should validate_presence_of(:tone) }
    it { should validate_numericality_of(:tone) }
    it { should validate_presence_of(:letter_index) }
    it { should validate_numericality_of(:letter_index) }
  end
  
end
