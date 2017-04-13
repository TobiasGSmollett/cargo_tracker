
module CargoTracker::Domain::Shared
  abstract class ValueObject
    abstract def ==(other : self): Bool
  end
end
