require './lib/scheduler'
require './helper'
RSpec.describe Planner::Scheduler do
  meeting = ''
  scheduler = Planner::Scheduler.new(2)
  
  it 'has max of meeting rooms' do
    expect(scheduler.meeting_rooms_count).to eq(2)
  end
  context 'console outputs' do
    it 'shows error in console' do
      MAX_ROOMS_NUMBER = 2 
      FILENAME = 'require_more_time.txt'
      expect { main }.to output("Error: More time for meetings required\n").to_stdout
    end
  end
end

