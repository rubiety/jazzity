require "spec_helper"

describe MusicianFriendship do
  describe "associations" do
    it { should belong_to(:musician) }
    it { should belong_to(:friend_musician) }
  end
end
