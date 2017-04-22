require "./*"
require "../voyage/*"
require "../location/*"
require "../cargo/*"
require "../../shared/*"

include CargoTracker::Domain::Shared
include CargoTracker::Domain::Model::Cargo
include CargoTracker::Domain::Model::Location
include CargoTracker::Domain::Model::Voyage

module CargoTracker::Domain::Model::Handling

  class HandlingEvent < DomainEvent

    enum Type
      LOAD
      UNLOAD
      RECEIVE
      CLAIM
      CUSTOMS
    end

    getter cargo : Cargo
    getter complete_time : Time
    getter registration_time : Time
    getter typ : Type
    getter location : Location
    getter voyage : (Voyage | Nil)

    def initialize(@cargo, @complete_time, @registration_time, @typ, @location, @voyage = nil); end

    def ==(other : self)
      self == other
    end
  end
end
