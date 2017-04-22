require "../../shared/*"

module CargoTracker::Domain::Model::Voyage

  struct VoyageNumber
    getter number : String
    
    def initialize(@number); end
  end

end
