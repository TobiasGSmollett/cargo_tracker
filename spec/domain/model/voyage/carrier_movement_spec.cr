require "../../../spec_helper"

include CargoTracker::Domain::Model::Voyage
include CargoTracker::Domain::Model::Location


describe CargoTracker do

  it "Equivalence of CarrierMovement" do
    tokyo = Location.new(UnLocode.new("JPTYO"), "Tokyo")
    newyork = Location.new(UnLocode.new("USNYC"), "NewYork")
    departure_time = Time.new
    arrival_time = Time.new
    movement1 = CarrierMovement.new(tokyo, newyork, departure_time, arrival_time)
    movement2 = CarrierMovement.new(tokyo, newyork, departure_time, arrival_time)
    true.should eq(movement1 == movement2)
  end

end
