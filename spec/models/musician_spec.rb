require "spec_helper"

describe Musician do
  it { should belong_to(:instrument) }

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  it "should expose name as first and last name" do
    described_class.new(:first_name => "Oscar", :last_name => "Fry").name.should == "Oscar Fry"
  end

  it "should expose name as #to_s" do
    described_class.new.tap do |musician|
      musician.should_receive(:name).and_return("Oscar Fry")
      musician.to_s.should == "Oscar Fry"
    end
  end
end
