require "spec_helper"

describe Progression do
  it { should belong_to(:meter) }
  it { should belong_to(:form) }
  it { should have_many(:components) }
  it { should have_many(:tunes_based_on) }
  it { should have_many(:tune_progressions) }
  it { should have_many(:tunes).through(:tune_progressions) }

  describe "scopes" do
    it "should scope full_tune"
    it "should scope partial"
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  it "should expose name as #to_s" do
    described_class.new(:name => "Test").to_s.should == "Test"
  end

  it "should expose beats as bars times meter beats" do
    described_class.new(:bars => 16).tap do |progression|
      progression.should_receive(:meter).and_return(mock(:beats, :beats => 4))
      progression.beats.should == 16 * 4
    end
  end

  it "should delegate resolve to find_by_name" do
    described_class.should_receive(:find_by_name).with("Test")
    described_class.resolve("Test")
  end

  it "should delegate [] to find_by_name" do
    described_class.should_receive(:find_by_name).with("Test")
    described_class["Test"]
  end
end
