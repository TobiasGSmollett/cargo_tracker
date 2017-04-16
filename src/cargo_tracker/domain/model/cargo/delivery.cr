require "../location/*"
require "../handling/*"
require "../voyage/*"
require "../../shared/*"

include CargoTracker::Domain::Shared
include CargoTracker::Domain::Model::Handling
include CargoTracker::Domain::Model::Location
include CargoTracker::Domain::Model::Voyage

module CargoTracker::Domain::Model::Cargo

  class Delivery < ValueObject
    getter transport_status : TransportStatus
    getter last_known_location : Location
    getter current_voyage : Voyage
    getter misdirected : Bool
    getter eta : Time
    getter next_expected_activity : HandlingActivity
    getter is_unloaded_at_destination : Bool
    getter routing_status : RoutingStatus
    getter calculated_at : Time
    getter last_event : HandlingEvent
    
    ETA_UNKOWN = nil
    NO_ACTIVITY = nil
    
    def update_on_routing(route_specification, itinerary)
      Delivery.new last_event, itinerary, route_specification
    end
    
    def self.derived_from(route_specification, itinerary, handling_history)
      last_event = handling_history.most_recently_completed_event
      Delivery.new last_event, itinerary, route_specification
    end
    
    private def initialize(@last_event, itinerary, route_specification)
      @calculated_at = Time.new

      @misdirected = calculate_misdirection_status itinerary
      @routing_status = calculate_routing_status itinerary, route_specification
      @transport_status = calculate_transport_status
      @last_known_location = calculate_last_known_location
      @current_voyage = calculate_current_voyage
      @eta = calculate_eta itinerary
      @next_expected_activity = calculate_next_expected_activity route_specification, itinerary
      @is_unloaded_at_destination = calculate_unloaded_at_destination route_specification
    end
    
    private def calculate_transport_status : TransportStatus::Type
      return TransportStatus::NOT_RECEIVED if last_event.nil?
      case last_event.typ
      when HandlingEvent::Type::LOAD
        TransportStatus::ONBOARD_CARRIER
      when HandlingEvent::Type::CUSTOMS
        TransportStatus::IN_PORT
      when HandlingEvent::Type::CLAIM
        TransportStatus::CLAIMED
      else
        TransportStatus::UNKNOWN
      end
    end
    
    private def calculate_last_known_location : Location
      return nil if last_event.nil?
      lastEvent.location
    end
    
    private def calculate_current_voyage : (Voyage | Nil)
      if transport_status == ONBOARD_CARRIER && !last_event.nil? 
        last_event.voyage
      end
    end


    private def calculate_misdirection_status(itinerary : Itinerary): Bool  
      return false if lastEvent.nil?
      !itinerary.is_expected? last_event
    end
    
    private def calculate_eta(itinerary : Itinerary): Time
      return itinerary.finalArrivalDate if on_track?
      ETA_UNKOWN
    end
    
    private def calculate_next_expected_activity(route_specification, itinerary): HandlingActivity
      return NO_ACTIVITY if !on_track?
      return HandlingActivity.new HandlingEvent::Type::RECEIVE, route_specification.origin
      case last_event.typ
      when HandlingEvent::Type::LOAD
        itinerary.legs.each do |leg|
          if leg.load_location == lastEvent.location
            return HandlingActivity.new HandlingEvent::Type::UNLOAD, leg.unloadLocation, leg.voyage
          end
        end
        NO_ACTIVITY
      when HandlingEvent::Type::UNLOAD
        
        
        
        NO_ACTIVITY
      when HandlingEvent::Type::RECEIVE
        first_leg = itinerary.legs.first
        HandlingActivity.new HandlingEvent::Type::LOAD, first_leg.load_location, first_leg.voyage
      else
        NO_ACTIVITY
      end
    end
    
    private def calculate_routing_status(itinerary, route_specification): RoutingStatus
      return NOT_ROUTED if itinerary.nil?
      if route_specification.is_satisfied_by? itinerary
        RoutingStatus::ROUTED
       else
        RoutingStatus::MISROUTED
      end
    end
    
    private def calculate_unloaded_at_destination(route_specification): Bool
      !last_eventnil? &&
      HandlingEvent::Type::UNLOAD == last_event.typ &&
      route_specification.destination == last_event.location
    end
    
    private def on_track?
      routing_status == RoutingStatus::ROUTED && !misdirected
    end
  end
end