require "./*"
require "../../shared/*"

include CargoTracker::Domain::Shared

module CargoTracker::Domain::Model::Cargo

  class Cargo < Entity(TrackingId)

    getter id

    def initialize(@id)
    end
  end
end
