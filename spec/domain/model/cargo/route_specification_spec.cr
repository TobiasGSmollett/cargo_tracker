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
    route_spec = RouteSpecification.new(tokyo,newyork, time)
    route_spec2 = RouteSpecification.new(tokyo,newyork, time)
    true.should eq(route_spec == route_spec2)
  end

end
