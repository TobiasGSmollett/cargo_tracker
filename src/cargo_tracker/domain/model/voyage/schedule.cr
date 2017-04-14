require "../../shared/*"

module CargoTracker::Domain::Model::Voyage

  class Schedule < ValueObject
    private property carrierMovements : Array(CarrierMovement)

    def initialize(carrierMovements)
      self.carrierMovements = carrierMovements
    end

    def ==(other : Schedule)
      carrierMovements == other.carrierMovements
    end
  end

end
