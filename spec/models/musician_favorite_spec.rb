require "spec_helper"

describe MusicianFavorite do
  describe "associations" do
    it { should belong_to(:musician) }
    it { should belong_to(:favorite_musician) }
  end
end
