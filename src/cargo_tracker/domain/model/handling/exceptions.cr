require "./*"
require "../voyage/*"
require "../location/*"
require "../cargo/*"
require "../../shared/*"

include CargoTracker::Domain::Shared
include CargoTracker::Domain::Model::Cargo
include CargoTracker::Domain::Model::Location
include CargoTracker::Domain::Model::Voyage

module CargoTracker::Domain::Model::Handling
  abstract class CannotCreateHandlingEventError < Exception
    getter id
    
    abstract def message : String
  end
  
  
  class UnknownCargoError < CannotCreateHandlingEventError  
      
    def initialize(@id : TrackingId)
    end
    
    def message
      "No cargo with tracking id " + id.to_s + " exists in the system"
    end
  end
  
  
  class UnknownLocationError < CannotCreateHandlingEventError  
      
    def initialize(@id : UnLocode)
    end
    
    def message
      "No location with UN locode " + id.to_s + " exists in the system"
    end
  end
  
  
  class UnknownVoyageError < CannotCreateHandlingEventError
    
    def initialize(@id : VoyageNumber)
    end
    
    def message
      "No voyage with number " + id.to_s + " exists in the system"
    end
  end
end