require "spec_helper"

describe TimelineEvent do
  describe "associations" do
    it { should belong_to(:actor) }
    it { should belong_to(:subject) }
    it { should belong_to(:secondary_subject) }
  end
end
