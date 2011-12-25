require "spec_helper"

describe Voicing do
  describe "associations" do
    it { should belong_to(:voicing_family) }
    it { should belong_to(:chord) }
    it { should have_many(:tones) }
    it { should have_many(:voice_leadings_to) }
    it { should have_many(:voice_leadings_from) }
    it { should belong_to(:upper_structure_chord) }
  end
end
