require "../../shared/*"
require "../location/*"

include CargoTracker::Domain::Model::Location

module CargoTracker::Domain::Model::Voyage

  class CarrierMovement < ValueObject
    getter departure_location : Location::Location
    getter arrival_location : Location::Location
    getter departure_time : Time
    getter arrival_time : Time

    def initialize(
      @departure_location,
      @arrival_location,
      @departure_time,
      @arrival_time)
    end

    def ==(other : self)
      departure_location == other.departure_location &&
      arrival_location == other.arrival_location &&
      departure_time == other.departure_time &&
      arrival_time == other.arrival_time
    end

  end

end
