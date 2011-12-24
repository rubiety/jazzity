require "spec_helper"

describe VoiceLeading do
  describe "associations" do
    it { should belong_to(:from_voicing) }
    it { should belong_to(:to_voicing) }
  end
end
