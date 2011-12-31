require "spec_helper"

describe Musician do
  it { should belong_to(:instrument) }

  describe "associations" do
    it { should have_many(:searchables) }
    it { should belong_to(:instrument) }
    it { should belong_to(:secondary_instrument) }
    it { should have_many(:timeline_events) }
  end

  describe "scopes" do
    it "should scope #with_profile"
    it "should scope #without_profile"
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  it "should expose name as first and last name" do
    described_class.new(:first_name => "Oscar", :last_name => "Fry").name.should == "Oscar Fry"
  end

  it "should expose name as #to_s" do
    described_class.new.tap do |musician|
      musician.should_receive(:name).and_return("Oscar Fry")
      musician.to_s.should == "Oscar Fry"
    end
  end

  describe "#clear_profile" do
    it "should null out profile fields"
    it "should set has_profile to false"
  end
end
