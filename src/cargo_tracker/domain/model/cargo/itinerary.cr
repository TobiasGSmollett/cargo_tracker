#require "./*"
require "../location/*"
require "../../shared/*"

include CargoTracker::Domain::Shared
include CargoTracker::Domain::Model::Location

module CargoTracker::Domain::Model::Cargo
  
  EMPTY_ITINERARY = Itinerary.new(Array(Leg).new)

  class Itinerary < ValueObject
    getter legs : Array(Leg)
    
    def initialize(@legs)
    end
    
    def ==(other : self)
      legs == other.legs
    end
    
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
    
    def is_expected?(event : HandlingEvent)
      return true if legs.empty?
      
      case event.typ
      when HandlingEvent::Type::RECEIVE
        legs.first.load_location == event.location
      when HandlingEvent::Type::CLAIM
        legs.last.unload_location == event.location
      when HandlingEvent::Type::CUSTOMS
        true
      else
        legs.any? { |leg| event.occurred? leg }
      end
    end
  end

end