module Planner
  class RoomCapacity

    def initialize(capacity, start_at, time_period)
      @meetings = []
      @capacity = capacity
      @start_at = start_at
      @time_period = time_period
    end

    def capacity
      @capacity
    end

    def room_has_capacity?(meeting)
      @capacity >= meeting.duration
    end

    def add_meeting(meeting)
      if room_has_capacity?(meeting)
        @meetings << meeting
        @capacity -= meeting.duration
      else 
        return false
      end
    end

    def format
      start_at = @start_at * 60
      @meetings.map do |meeting|
        s = "%02d:%02d%s %s" % [ start_at / 60, start_at % 60, @time_period, meeting.format ]
        start_at += meeting.duration
        s
      end.join("\n")
    end

  end
end