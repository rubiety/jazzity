require "spec_helper"

describe Comment do
  describe "associations" do
    it { should belong_to(:commentable) }
    it { should belong_to(:author) }
    it { should have_many(:timeline_events) }
  end

  describe "validations" do
    it { should validate_presence_of(:content) }
  end
end
