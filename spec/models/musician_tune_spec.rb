require "spec_helper"

describe MusicianTune do
  describe "associations" do
    it { should belong_to(:musician) }
    it { should belong_to(:tune) }
  end

  describe "scopes" do
    it "should scope composed"
    it "should scope learning"
    it "should scope know"
  end
end

