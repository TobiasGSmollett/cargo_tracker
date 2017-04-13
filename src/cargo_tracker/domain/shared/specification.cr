require "./*"

module CargoTracker::Domain::Shared

  #
  # Specification interface.
  #
  abstract class Specification(T)
    abstract def is_satisfied_by?(target : T)

    abstract def and(other : Specification(T)): Specification(T)

    abstract def or(other : Specification(T)): Specification(T)

    abstract def not(other : Specification(T)): Specification(T)
  end

  #
  # Abstract base implementation of composition Specification with default
  # implementations for AndSpecification, OrSpecification and NotSpecification
  #
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

  class AndSpecification(T) < AbstractSpecification(T)
    private property spec1, spec2

    def initialize(@spec1, @spec2)
    end

    def is_satisfied_by?(target : T)
      spec1.is_satisfied_by? target && spec2.is_satisfied_by? target
    end
  end

  class OrSpecification(T) < AbstractSpecification(T)
    private property spec1, spec2

    def initialize(@spec1, @spec2)
    end

    def is_satisfied_by?(target : T)
      spec1.is_satisfied_by? target || spec2.is_satisfied_by? target
    end
  end

  class NotSpecification(T) < AbstractSpecification(T)
    private property spec1

    def initialize(@spec1)
    end

    def is_satisfied_by?(target : T)
      !spec1.is_satisfied_by? target
    end
  end

end
