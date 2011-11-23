require "spec_helper"

describe Comment do
  describe "associations" do
    it { should belong_to(:commentable) }
    it { should belong_to(:author) }
  end

  describe "validations" do
    it { should validate_presence_of(:content) }
  end

  describe "#up_vote" do
    it "should increment votes"
  end

  describe "#down_vote" do
    it "should decrement votes"
  end
end
