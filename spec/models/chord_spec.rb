require "spec_helper"

describe Chord do
  context "associations" do
    it { should belong_to(:chord_quality) }
    it { should have_many(:symbols) }
    it { should have_one(:primary_symbol) }
    it { should have_many(:chord_scales) }
    it { should have_many(:modes).through(:chord_scales) }
    it { should have_many(:tones) }
    it { should have_many(:voicings) }
    
  end
  
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:chord_quality) }
  end
  
  it "should expose name as #to_s" do
    Chord.new(:name => "Test").to_s.should == "Test"
  end
  
  it "should expose #symbols_list"
  
  context "without key context" do
    let(:chord) { Chord.new(:name => "Test") }
    
    it "should expose #title as name" do
      chord.title.should == "Test"
    end
  end
  
  context "with key context" do
    let(:chord) { Chord.new(:name => "Test").in_key_of("Bb") }
    
    it "should expose #title as key and name" do
      # TODO chord.title.should == "Bb Test"
    end
  end
  
end
