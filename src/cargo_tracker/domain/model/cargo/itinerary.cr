require "../location/*"
require "../../shared/*"

include CargoTracker::Domain::Model::Location

module CargoTracker::Domain::Model::Cargo

  struct Itinerary
    getter legs : Array(Leg)

    def initialize(@legs); end

    def initial_departure_location
      legs.empty? ? Location::UNKNOWN : legs.first.load_location
    end

    def final_arrival_location
      legs.empty? ? Location::UNKNOWN : legs.last.load_location
    end

    def final_arrival_date
      return Time::MaxValue if legs.empty?
      legs.last.unload_time
    end

    def expected?(event)
      return true if legs.empty?

      case event.typ
      when HandlingEvent::Type::RECEIVE
        legs.first.load_location == event.location
      when HandlingEvent::Type::CLAIM
        legs.last.unload_location == event.location
      when HandlingEvent::Type::LOAD
        legs.any? do |leg|
          leg.load_location == event.location && leg.voyage == event.voyage
        end
      when HandlingEvent::Type::UNLOAD
        legs.any? do |leg|
          leg.unload_location == event.location && leg.voyage == event.voyage
        end
      else
        # HandlingEvent::Type::CUSTOMS
        true
      end
    end

    EMPTY = Itinerary.new(Array(Leg).new)
  end

end
