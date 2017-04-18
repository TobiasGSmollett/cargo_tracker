require "../../../spec_helper"
require "spec2-mocks"
require "spec"

include CargoTracker::Domain::Model::Voyage
include Mocks::Macro::GlobalDSL

describe CargoTracker do
  it "Equivalence of Schedule" do
    tokyo = Location.new(UnLocode.new("JPTYO"), "Tokyo")
    newyork = Location.new(UnLocode.new("USNYC"), "NewYork")
    time = Time.new

    sample = CarrierMovement.new(newyork,newyork, time,time)
    a = Schedule.new([sample, sample])
    b = Schedule.new([sample, sample])
    c = Schedule.new([sample, sample, sample])

    true.should eq(a == b)
    false.should eq(a == c)
  end

end
