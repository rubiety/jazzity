require "spec_helper"

describe Tune do
  context "associations" do
    it { should belong_to(:vehicle) }
    it { should belong_to(:meter) }
    it { should belong_to(:primary_key) }
    it { should belong_to(:secondary_key) }
    it { should belong_to(:form) }
    it { should belong_to(:starting_chord) }
    it { should belong_to(:ending_chord) }
    it { should belong_to(:contrafact_of_tune) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    # it { should validate_inclusion_of(:tonality).in("Major", "Minor") }
    # it { should validate_inclusion_of(:concept).in("Instrumental", "Vocal") }
  end

  it "should expose title as #to_s" do
    described_class.new.tap do |tune|
      tune.should_receive(:title).and_return("Test")
      tune.to_s.should == "Test"
    end
  end

  describe "title" do
    it "should be name when no alternate name" do
      described_class.new(:name => "Tune").title.should == "Tune"
    end

    it "should be name with alternate name in parenthesis when no alternate name" do
      described_class.new(:name => "Tune", :alternate_name => "Alt").title.should == "Tune (Alt)"
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
