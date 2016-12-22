require './lib/meeting'
RSpec.describe Planner::Meeting do
  meeting = 'All Hands meeting 60min'.match('(.*) (\d+)min')
  meeting = Planner::Meeting.new(meeting[1], meeting [2].to_i)
  
  it 'has a title' do
    expect(meeting).to respond_to(:title)
  end
  
  it 'has a time' do
    expect(meeting).to respond_to(:duration)
  end

end
