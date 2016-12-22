module Planner
  class MeetingRoom

    def initialize(room_number)
      @room_number = room_number

      @morning = RoomCapacity.new(180, 9, "AM")
      @evening = RoomCapacity.new(240, 1, "PM")
    end
    
    def morning
      @morning
    end

    def evening
      @evening 
    end

    def add_meeting(meeting)
      @morning.add_meeting(meeting) || @evening.add_meeting(meeting)
    end

    def title
      "Room #{@room_number}:"
    end

    def lunch_time_capacity
      "12:00PM Lunch"
    end


    def to_s
      [ title, @morning.format, lunch_time_capacity, @evening.format ].join("\n")
    end
  end
end
