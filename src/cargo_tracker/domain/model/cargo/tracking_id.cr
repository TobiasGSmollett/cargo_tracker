require "./*"
require "../../shared/*"

include CargoTracker::Domain::Shared

module CargoTracker::Domain::Model::Cargo

  class TrackingId < ValueObject
    getter value : String

    def initialize(@value)
    end

    def ==(other : TrackingId)
      value == other.value
    end

    def hash
      value.hash
    end

    def to_s
      value
    end
  end

end
