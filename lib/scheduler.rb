module Planner 
  class Scheduler

    def initialize(available_meeting_rooms_count)
     @meeting_rooms_count = available_meeting_rooms_count
    end

    def meeting_rooms_count
      @meeting_rooms_count
    end

    def schedule(meetings)
      meeting_rooms = (1..@meeting_rooms_count).map { |number| MeetingRoom.new(number) }
      meeting_room_index = 0
      meetings.each do |meeting|
        meeting_room = meeting_rooms[meeting_room_index]
        next if meeting_room.add_meeting(meeting)
        place_meeting(meeting_rooms, meeting, meeting_room_index)
      end
      meeting_rooms
    end

    def place_meeting(meeting_rooms,meeting, meeting_room_index)
      (1..meeting_rooms.size).each do |attempts|
        i = (meeting_room_index + attempts) % meeting_rooms.size
        if meeting_rooms[i].add_meeting(meeting)
          meeting_room_index = i
        break
        end
      end
    end

  end
end