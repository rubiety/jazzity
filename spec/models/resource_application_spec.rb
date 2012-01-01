require "spec_helper"

describe ResourceApplication do
  describe "associations" do
    it { should belong_to(:resource) }
    it { should belong_to(:resourceable) }
  end
end
