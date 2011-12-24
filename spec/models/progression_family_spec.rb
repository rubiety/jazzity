require "spec_helper"

describe ProgressionFamily do
  describe "associations" do
    it { should have_many(:progressions) }
  end
end

