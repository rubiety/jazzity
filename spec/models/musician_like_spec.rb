require "spec_helper"

describe MusicianLike do
  describe "associations" do
    it { should belong_to(:musician) }
    it { should belong_to(:likeable) }
  end
end
