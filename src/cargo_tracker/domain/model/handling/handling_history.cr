require "./*"
require "../../shared/*"


module CargoTracker::Domain::Model::Handling
  struct HandlingHistory
    EMPTY = HandlingHistory.new Array(HandlingEvent).new

    getter handling_events : Array(HandlingEvent)

    def initialize(@handling_events); end

    def distinct_events_by_completion_time
      handling_events
      .sort(&BY_COMPLETION_TIME_COMPARATOR)
      .uniq!
    end

    def most_recently_completed_event
      distinct_events = distinct_events_by_completion_time
      return nil if distinct_events.empty?
      distinct_events.last
    end
  end

  BY_COMPLETION_TIME_COMPARATOR =
    ->(a : HandlingEvent, b : HandlingEvent){
      a.complete_time <=> b.complete_time
    }
end
