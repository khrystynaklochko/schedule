require './lib/meeting_room'
require './lib/meeting'
require './lib/room_capacity'

RSpec.describe Planner::MeetingRoom do
  context 'initialize'do
    meeting_room1 = Planner::MeetingRoom.new(1)
    meeting_room2 = Planner::MeetingRoom.new(2)
    it 'a room1 has a title Room 1:' do
      expect(meeting_room1.title).to eq('Room 1:')
    end
    it 'a room2 has a title Room 2:' do
      expect(meeting_room2.title).to eq('Room 2:')
    end
  end

  context 'has initial capacity' do
    meeting_room = Planner::MeetingRoom.new(1)
    it 'splits capacity morning and evening based on lunch time' do
      expect(meeting_room.morning.capacity).to eq(180)
      expect(meeting_room.evening.capacity).to eq(240)
    end

    it 'has Lunch time capacity' do
      expect(meeting_room.lunch_time_capacity).to eq("12:00PM Lunch")
    end
  end

  context 'reduces capacity by adding a meeting' do
    meeting_room = Planner::MeetingRoom.new(1)
    meeting = 'All Hands meeting 60min'.match('(.*) (\d+)min')
    meeting = Planner::Meeting.new(meeting[1], meeting [2].to_i)
    
    it 'adds a meeting' do
      meeting_room.add_meeting(meeting)
      expect(meeting_room.morning.capacity).to eq(120)
      expect(meeting_room.lunch_time_capacity).to eq("12:00PM Lunch")
    end

  end


end
