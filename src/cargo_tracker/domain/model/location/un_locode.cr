require "../../shared/*"

include CargoTracker::Domain::Shared

module CargoTracker::Domain::Model::Location

  class UnLocode < ValueObject
    @@VALID_PATTERN = Regex.new("[a-zA-Z]{2}[a-zA-Z2-9]{3}")

    getter unlocode : String

    def initialize(countryAndLocation : String)
      if !@@VALID_PATTERN.match(countryAndLocation)
        countryAndLocation += " is not a valid UN/LOCODE (does not match pattern)"
      end
      @unlocode = countryAndLocation.upcase
    end

    def ==(other : self)
      unlocode == other.unlocode
    end

    def hash
      unlocode.hash
    end

    def to_s
      unlocode
    end
  end

end
