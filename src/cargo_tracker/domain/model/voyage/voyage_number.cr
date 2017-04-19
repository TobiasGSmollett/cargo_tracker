require "../../shared/*"

module CargoTracker::Domain::Model::Voyage

  class VoyageNumber < ValueObject

    getter number : String

    def initialize(@number : String)
    end

    def ==(other : self)
      number == other.number
    end

    def hash
      number.hash
    end

    def to_s
      number
    end
  end

end
