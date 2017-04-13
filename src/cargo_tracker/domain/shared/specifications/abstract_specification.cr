
module CargoTracker::Domain::Shared

  abstract class AbstractSpecification(T) < Specification(T)
    abstract def is_satisfied_by?(target : T)

    def and(other : Specification(T)): Specification(T)
      AndSpecification.new(self, other)
    end

    def or(other : Specification(T)): Specification(T)
      OrSpecification.new(self, other)
    end

    def not(other : Specification(T)): Specification(T)
      NotSpecification.new(other)
    end
  end

end
