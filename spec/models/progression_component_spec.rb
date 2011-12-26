require "spec_helper"

describe ProgressionComponent do
  describe "associations" do
    it { should belong_to(:progression) }
    it { should belong_to(:chord) }
  end
end
