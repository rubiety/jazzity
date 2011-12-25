require "spec_helkper"

describe VoicingFamily do
  describe "associations" do
    it { should have_many(:voicings) }
  end
end
