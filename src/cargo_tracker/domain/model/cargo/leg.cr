require "../location/*"
require "../voyage/*"
require "../../shared/*"

include CargoTracker::Domain::Location
include CargoTracker::Domain::Voyage
include CargoTracker::Domain::Shared

module CargoTracker::Domain::Model::Cargo

  class Leg < ValueObject

    getter voyage : Voyage
    getter loadLocation : Location
    getter unloadLocation : Location
    getter loadTime : Time
    getter unloadTime : Time

    def initialize(@voyage, @loadLocation, @unloadLocation, @loadTime, @unloadTime)
    end

    def ==(other : self)
      voyage == other.voyage &&
      loadLocation == other.loadLocation &&
      unloadLocation == other.unloadLocation &&
      loadTime == other.loadTime &&
      unloadTime == other.unloadTime
    end
  end
end
