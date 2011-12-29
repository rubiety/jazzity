require "spec_helper"

describe VoicingFamily do
  describe "associations" do
    it { should have_many(:voicings) }
  end
end
