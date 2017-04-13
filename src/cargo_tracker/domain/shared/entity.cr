
module CargoTracker::Domain::Shared

  #
  # An entity, as explained in the DDD bool.
  #
  abstract class Entity(ID)
    abstract def id : ID

    # Entities compare by identity, not by attributes.
    def ==(other : self)
      self.@id == other.@id
    end
  end

end
