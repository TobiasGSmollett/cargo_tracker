require "../../spec_helper"

include CargoTracker::Domain::Shared

class Left < Specification(Int32)
  def is_satisfied_by?(target : Int32)
    3 < target
  end
end

class Right < Specification(Int32)
  def is_satisfied_by?(target : Int32)
    target < 13
  end
end

describe CargoTracker do

  it "AndSpecification" do
    and = AndSpecification.new(Left.new, Right.new)
    true.should eq(and.is_satisfied_by? 4)
    true.should eq(and.is_satisfied_by? 5)
    true.should eq(and.is_satisfied_by? 7)
    true.should eq(and.is_satisfied_by? 11)
    true.should eq(and.is_satisfied_by? 12)

    false.should eq(and.is_satisfied_by? 2)
    false.should eq(and.is_satisfied_by? 3)
    false.should eq(and.is_satisfied_by? 13)
    false.should eq(and.is_satisfied_by? 14)
    end

end
