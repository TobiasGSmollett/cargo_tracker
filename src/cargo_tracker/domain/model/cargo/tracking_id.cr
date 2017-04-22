require "../../shared/*"

include CargoTracker::Domain::Shared

module CargoTracker::Domain::Model::Cargo

  struct TrackingId
    getter value : String

    def initialize(@value); end
  end

end
