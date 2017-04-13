require "../../../spec_helper"

include CargoTracker::Domain::Model::Cargo

describe CargoTracker do

  it "Equivalence of TrackingId" do
    true.should eq( TrackingId.new("1") == TrackingId.new("1") )
    false.should eq( TrackingId.new("1") == TrackingId.new("2") )
  end

end
