
module CargoTracker::Domain::Shared
  abstract class DomainEvent
    abstract def ==(other : self)
  end
end
