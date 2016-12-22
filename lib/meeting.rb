module Planner
  class Meeting

    attr_accessor :title, :duration

    def initialize(title, duration)
      @title = title
      @duration = duration
    end

    def format
      "#{title} #{duration}min"
    end
  end
end

