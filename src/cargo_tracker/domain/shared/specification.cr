require "./*"

module CargoTracker::Domain::Shared

  #
  # Specification interface.
  # Abstract base implementation of composition Specification with default
  # implementations for AndSpecification, OrSpecification and NotSpecification
  #
  abstract class Specification(T)
    def is_satisfied_by?(target : T)
    end

    def and(other : self)
      AndSpecification.new(self, other)
    end

    def or(other : self)
      OrSpecification.new(self, other)
    end

    def not(other : self)
      NotSpecification.new(other)
    end
  end

  class AndSpecification(T) < Specification(T)
    private property spec1, spec2

    def initialize(@spec1, @spec2)
    end

    def is_satisfied_by?(target : T)
      spec1.is_satisfied_by? target && spec2.is_satisfied_by? target
    end
  end

  class OrSpecification(T) < Specification(T)
    private property spec1, spec2

    def initialize(@spec1, @spec2)
    end

    def is_satisfied_by?(target : T)
      spec1.is_satisfied_by? target || spec2.is_satisfied_by? target
    end
  end

  class NotSpecification(T) < Specification(T)
    private property spec1

    def initialize(@spec1)
    end

    def is_satisfied_by?(target : T)
      !spec1.is_satisfied_by? target
    end
  end

end
