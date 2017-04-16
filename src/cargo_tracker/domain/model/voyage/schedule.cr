require "./*"
require "../../shared/*"

module CargoTracker::Domain::Model::Voyage

  class Schedule < ValueObject
    private property carrier_movements : Array(CarrierMovement)

    def initialize(@carrier_movements)
    end

    def ==(other : Schedule)
      carrier_movements == other.carrier_movements
    end
  end

end
