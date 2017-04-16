require "../../shared/*"

include CargoTracker::Domain::Shared

module CargoTracker::Domain::Model::Cargo
  enum TransportStatus
    NOT_RECEIVED
    IN_PORT
    ONBOARD_CARRIER
    CLAIMED
    UNKNOWN
  end
end