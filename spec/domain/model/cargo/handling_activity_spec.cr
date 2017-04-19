require "../../../spec_helper"

include CargoTracker::Domain::Model::Cargo
include CargoTracker::Domain::Model::Voyage
include CargoTracker::Domain::Model::Location

describe CargoTracker do

  it "Equivalence of handling activity" do
    tokyo = Location.new(UnLocode.new("JPTYO"), "Tokyo")
    newyork = Location.new(UnLocode.new("USNYC"), "NewYork")

    a = HandlingActivity.new(HandlingEvent::Type::LOAD, tokyo)
    b = HandlingActivity.new(HandlingEvent::Type::LOAD, tokyo)
    c = HandlingActivity.new(HandlingEvent::Type::LOAD, newyork)

    true.should eq(a == b)
    false.should eq(a == c)
  end

end
