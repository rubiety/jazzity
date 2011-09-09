require "spec_helper"

describe KeyContext do
  subject do
    Class.new do
      include KeyContext
    end.new
  end
  
  it { should respond_to(:key) }
  it { should respond_to(:in_key_of) }
  it { should respond_to(:in) }
  it { should respond_to(:without_key) }
  
  it "should set key by name" do
    subject.in_key_of("Bb").key.should == Key["Bb"]
  end
  
  it "should set key by Key object" do
    subject.in_key_of(Key["Bb"]).key.should == Key["Bb"]
  end
  
  it "should release key context with #without_key" do
    subject.in_key_of("Bb")
    subject.without_key
    subject.key.should be_nil
  end
end
