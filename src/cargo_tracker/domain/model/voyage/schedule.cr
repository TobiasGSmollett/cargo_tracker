require "../../shared/*"

module CargoTracker::Domain::Model::Voyage

  struct Schedule
    getter carrier_movements : Array(CarrierMovement)

    def initialize(@carrier_movements); end
  end

end
