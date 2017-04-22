require "./*"
require "../../shared/*"

module CargoTracker::Domain::Model::Voyage

  class Voyage < Entity(VoyageNumber)
    getter id : VoyageNumber
    getter schedule : Schedule

    def initialize(@id, @schedule); end

    def hash
      id.hash
    end

    def to_s
      "Voyage " + id
    end
  end

end
