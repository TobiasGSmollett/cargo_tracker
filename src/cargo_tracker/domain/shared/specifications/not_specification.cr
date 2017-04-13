
module CargoTracker::Domain::Shared
  class NotSpecification(T) < AbstractSpecification(T)
    private property spec1

    def initialize(@spec1)
    end

    def is_satisfied_by?(target : T)
      !spec1.is_satisfied_by? target
    end
  end
end
