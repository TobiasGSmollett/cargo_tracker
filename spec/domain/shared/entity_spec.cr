require "../../spec_helper"

include CargoTracker::Domain::Shared

class A < Entity(Int32)
  getter id
  def initialize(@id : Int32)
  end
end

class B < Entity(Int32)
  getter id
  def initialize(@id : Int32)
  end
end

describe CargoTracker do

  it "Equivalence of Entities" do
    true.should eq( A.new(1) == A.new(1) )
    false.should eq( A.new(1) == A.new(2) )
    false.should eq( A.new(1) == B.new(1) )
  end
end
