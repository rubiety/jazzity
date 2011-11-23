require "spec_helper"

describe TuneConcept do
  describe "associations" do
    it { should belong_to(:tune) }
    it { should belong_to(:concept) }
  end
end
