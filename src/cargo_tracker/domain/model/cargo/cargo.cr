require "./*"
require "../location/*"
require "../../shared/*"


include CargoTracker::Domain::Shared

module CargoTracker::Domain::Model::Cargo

  class Cargo < Entity(TrackingId)

    getter id : TrackingId
    getter origin : Location::Location
    getter route_specification : RouteSpecification
    getter itinerary : Itinerary
    getter delivery : Delivery

    def initialize(@id, @route_specification)
      @origin = route_specification.origin
      @itinerary = Itinerary::EMPTY
      @delivery = Delivery.derived_from @route_specification, @itinerary, HandlingHistory::EMPTY
    end

    def specify_new_route(route_rpecification)
      @route_specification = route_specification
      @delivery = delivery.update_on_routing route_specification, itinerary
    end

    def assign_to_route(itinerary)
      @itinerary = itinerary
      @delivery = delivery.update_on_routing route_specification, itinerary
    end

    def derive_delivery_progress(handlingHistory)
      @delivery = Delivery.derived_from route_specification, itinerary, handling_history
    end
  end
end
