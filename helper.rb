def main
  test_file = File.open(FILENAME, "r")

  meetings_total_time = 0 
  meetings =[]
  test_file&.each_line do |line|
    meeting = line.match('(.*) (\d+)min')
    meetings_total_time+= meeting[2].to_i
    meeting = Planner::Meeting.new(meeting[1], meeting [2].to_i)
    meetings << meeting
  end

  #Check if all meetings could fits into two rooms
  if meetings_total_time > 14*60
    puts 'Error: More time for meetings required'
  else
    scheduler = Planner::Scheduler.new(MAX_ROOMS_NUMBER)
    scheduler.schedule(meetings).each do |meeting_in_rooms|
      puts "#{meeting_in_rooms}\n\n"
    end
  end
end