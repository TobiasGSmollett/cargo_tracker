require "../../../spec_helper"

include CargoTracker::Domain::Model::Location

describe CargoTracker do

  it "Equivalence of UnLocode" do
    true.should eq( UnLocode.new("JPTYO") == UnLocode.new("JPTYO") )
    false.should eq( UnLocode.new("JPTYO") == UnLocode.new("USNYC") )
  end

end
