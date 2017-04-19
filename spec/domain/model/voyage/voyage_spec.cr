require "../../../spec_helper"

include CargoTracker::Domain::Model::Voyage

describe CargoTracker do
  it "Equivalence of Voyage" do
    tokyo = Location.new(UnLocode.new("JPTYO"), "Tokyo")
    newyork = Location.new(UnLocode.new("USNYC"), "NewYork")
    time = Time.new

    sample = CarrierMovement.new(newyork,newyork, time,time)
    a = Schedule.new([sample, sample])
    b = Schedule.new([sample, sample])
    c = Schedule.new([sample, sample, sample])

    d = Voyage.new(VoyageNumber.new("1"),a)
    e = Voyage.new(VoyageNumber.new("2"),a)
    f = Voyage.new(VoyageNumber.new("1"),b)

    false.should eq(d == e)
    true.should eq(d == f)
  end

end
