require "./*"
require "../../shared/*"

include CargoTracker::Domain::Shared

module CargoTracker::Domain::Model::Location

  #
  # A location is our model is stops on a journey, such as cargo
  # origin or destination, or carrier movement endpoints.
  #
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
