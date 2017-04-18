require "./*"
require "../../shared/*"

module CargoTracker::Domain::Model::Voyage

  class Schedule < ValueObject
    getter carrier_movements : Array(CarrierMovement)

    def initialize(@carrier_movements : Array(CarrierMovement))
    end

    def ==(other : Schedule)
      carrier_movements == other.carrier_movements
    end
  end

end
