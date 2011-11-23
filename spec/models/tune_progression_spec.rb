require "spec_helper"

describe TuneProgression do
  describe "associations" do
    it { should belong_to(:tune) }
    it { should belong_to(:progression) }
  end
end
