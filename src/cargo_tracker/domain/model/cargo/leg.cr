require "../location/*"
require "../voyage/*"
require "../../shared/*"

include CargoTracker::Domain::Model::Location
include CargoTracker::Domain::Model::Voyage
include CargoTracker::Domain::Shared

module CargoTracker::Domain::Model::Cargo

  struct Leg

    getter voyage : Voyage::Voyage
    getter load_location : Location::Location
    getter unload_location : Location::Location
    getter load_time : Time
    getter unload_time : Time

    def initialize(@voyage, @load_location, @unload_location, @load_time, @unload_time); end
  end
end
