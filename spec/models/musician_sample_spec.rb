require "spec_helper"

describe MusicianSample do
  describe "associations" do
    it { should belong_to(:musician) }
  end
end
