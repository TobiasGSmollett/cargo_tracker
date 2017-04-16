require "../../shared/*"

include CargoTracker::Domain::Shared

module CargoTracker::Domain::Model::Cargo
  enum RoutingStatus
    NOT_ROUTED
    ROUTED
    MISROUTED
  end
end