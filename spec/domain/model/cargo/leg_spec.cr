require "../../../spec_helper"
require "spec2-mocks"

include CargoTracker::Domain::Model::Cargo
include CargoTracker::Domain::Model::Voyage
include CargoTracker::Domain::Model::Location

describe CargoTracker do

  it "Equivalence of Leg" do
    tokyo = Location.new(UnLocode.new("JPTYO"), "Tokyo")
    newyork = Location.new(UnLocode.new("USNYC"), "NewYork")
    time = Time.new

    movement = CarrierMovement.new(newyork,newyork, time,time)
    schedule = Schedule.new([movement, movement])

    voyage = Voyage.new(VoyageNumber.new("1"),schedule)

    location = CargoTracker::Domain::Model::Location::UNKNOWN

    leg = Leg.new(voyage, location, location, time, time)

    true.should eq(leg == leg)
  end

end
