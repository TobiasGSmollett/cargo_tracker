require "../location/*"
require "../handling/*"
require "../voyage/*"
require "../../shared/*"

include CargoTracker::Domain::Shared
include CargoTracker::Domain::Model::Handling
include CargoTracker::Domain::Model::Location
include CargoTracker::Domain::Model::Voyage

module CargoTracker::Domain::Model::Cargo

  struct HandlingActivity
    getter typ : HandlingEvent::Type
    getter location : Location::Location
    getter voyage : (Voyage::Voyage | Nil)

    def initialize(@typ, @location, @voyage = nil); end
  end

end
