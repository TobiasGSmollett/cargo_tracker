require "../../../spec_helper"
require "spec2-mocks"

include CargoTracker::Domain::Model::Cargo
include CargoTracker::Domain::Model::Voyage
include CargoTracker::Domain::Model::Location

describe CargoTracker do

  it "Equivalence of Cargo" do
    tokyo = Location.new(UnLocode.new("JPTYO"), "Tokyo")
    newyork = Location.new(UnLocode.new("USNYC"), "NewYork")
    time = Time.new
    route_spec = RouteSpecification.new(tokyo,newyork, time)
    route_spec2 = RouteSpecification.new(tokyo,tokyo, time)

    a = Cargo.new(TrackingId.new("1"), route_spec)
    #b = Cargo.new(TrackingId.new("1"), route_spec2)
    #c = Cargo.new(TrackingId.new("2"), route_spec)

    #true.should eq(a == b)
    #false.should eq(a == c)
  end

end
