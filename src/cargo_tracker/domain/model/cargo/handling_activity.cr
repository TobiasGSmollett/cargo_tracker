require "../location/*"
require "../handling/*"
require "../voyage/*"
require "../../shared/*"

include CargoTracker::Domain::Shared
include CargoTracker::Domain::Model::Handling
include CargoTracker::Domain::Model::Location
include CargoTracker::Domain::Model::Voyage

module CargoTracker::Domain::Model::Cargo

  class HandlingActivity < ValueObject
    getter typ : HandlingEvent::Type
    getter location : Location::Location
    getter voyage : (Voyage::Voyage | Nil)

    def initialize(@typ, @location)
      @voyage = nil
    end

    def initialize(@typ, @location, @voyage)
    end

    def ==(other : self)
      typ == other.typ && location == other.location && voyage == other.voyage
    end
  end

end
