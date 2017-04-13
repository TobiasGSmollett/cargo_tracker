
module CargoTracker::Domain::Shared

  # Specification interface.
  abstract class Specification(T)
    abstract def is_satisfied_by?(target : T)

    abstract def and(other : Specification(T)): Specification(T)

    abstract def or(other : Specification(T)): Specification(T)

    abstract def not(other : Specification(T)): Specification(T)
  end
end
