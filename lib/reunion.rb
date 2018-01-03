require_relative "activity"

class Reunion

  attr_reader :location
  attr_accessor :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(name)
    activities << Activity.new(name)
  end

end
