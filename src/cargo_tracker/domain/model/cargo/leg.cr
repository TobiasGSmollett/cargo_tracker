require "../location/*"
require "../voyage/*"
require "../../shared/*"

include CargoTracker::Domain::Model::Location
include CargoTracker::Domain::Model::Voyage
include CargoTracker::Domain::Shared

module CargoTracker::Domain::Model::Cargo

  class Leg < ValueObject

    getter voyage : Voyage
    getter load_location : Location
    getter unload_location : Location
    getter load_time : Time
    getter unload_time : Time

    def initialize(@voyage, @load_location, @unload_location, @load_time, @unload_time)
    end

    def ==(other : self)
      voyage == other.voyage &&
      load_location == other.load_location &&
      unload_location == other.unload_location &&
      load_time == other.load_time &&
      unload_time == other.unload_time
    end
  end
end
