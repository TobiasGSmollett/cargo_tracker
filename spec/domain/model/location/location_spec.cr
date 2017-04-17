require "../../../spec_helper"

include CargoTracker::Domain::Model::Location

describe CargoTracker do

  it "Equivalence of Location" do
    tokyo = Location.new(UnLocode.new("JPTYO"), "Tokyo")
    tokyo2 = Location.new(UnLocode.new("JPTYO"), "Tokyo")
    newyork = Location.new(UnLocode.new("USNYC"), "NewYork")
    false.should eq(tokyo == newyork)
    true.should eq(tokyo == tokyo2)
  end

end
