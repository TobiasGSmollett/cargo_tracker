require "../../spec_helper"

include CargoTracker::Domain::Shared

class OrLeft < Specification(Int32)
  def is_satisfied_by?(target : Int32)
     target < 4
  end
end

class OrRight < Specification(Int32)
  def is_satisfied_by?(target : Int32)
    12 < target
  end
end

describe CargoTracker do

  it "OrSpecification" do
    or = OrSpecification.new(OrLeft.new, OrRight.new)
    false.should eq(or.is_satisfied_by? 4)
    false.should eq(or.is_satisfied_by? 5)
    false.should eq(or.is_satisfied_by? 7)
    false.should eq(or.is_satisfied_by? 11)
    false.should eq(or.is_satisfied_by? 12)

    true.should eq(or.is_satisfied_by? 2)
    true.should eq(or.is_satisfied_by? 3)
    true.should eq(or.is_satisfied_by? 13)
    true.should eq(or.is_satisfied_by? 14)
    end

end
