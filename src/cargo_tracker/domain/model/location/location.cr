require "./*"
require "../../shared/*"

include CargoTracker::Domain::Shared

module CargoTracker::Domain::Model::Location

  class Location < Entity(UnLocode)

    getter id : UnLocode, name : String

    def initialize(@id, @name)
    end

    def un_locode
      id
    end

    def hash
      id.hash
    end

    def to_s
      name + " [" + un_locode + "]"
    end
  end

end
