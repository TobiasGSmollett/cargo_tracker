require "../../shared/*"

module CargoTracker::Domain::Model::Voyage

  class Voyage < Entity(VoyageNumber)
    getter voyage_number : VoyageNumber
    getter schedule : Schedule

    def initialize(voyage_number, schedule)
      self.voyage_number = voyage_number
      self.schedule = schedule
    end

    def hash
      voyage_number.hash
    end

    def to_s
      "Voyage " + voyage_number
    end
  end

end
