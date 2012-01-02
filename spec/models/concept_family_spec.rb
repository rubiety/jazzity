require "spec_helper"

describe ConceptFamily do
  describe "associations" do
    it { should have_many(:concepts) }
  end
end
