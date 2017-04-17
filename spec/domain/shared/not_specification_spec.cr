require "../../spec_helper"

include CargoTracker::Domain::Shared

class NotSpec < Specification(Int32)
  def is_satisfied_by?(target : Int32)
     target < 4
  end
end

describe CargoTracker do

  it "NotSpecification" do
    or = NotSpecification.new(NotSpec.new)
    false.should eq(or.is_satisfied_by? 1)
    false.should eq(or.is_satisfied_by? 2)
    false.should eq(or.is_satisfied_by? 3)

    true.should eq(or.is_satisfied_by? 4)
    true.should eq(or.is_satisfied_by? 5)
    true.should eq(or.is_satisfied_by? 6)
    end

end
