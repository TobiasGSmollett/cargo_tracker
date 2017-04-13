
module CargoTracker::Domain::Shared
  class AndSpecification(T) < AbstractSpecification(T)
    private property spec1, spec2

    def initialize(@spec1, @spec2)
    end

    def is_satisfied_by?(target : T)
      spec1.is_satisfied_by? target && spec2.is_satisfied_by? target
    end
  end
end
