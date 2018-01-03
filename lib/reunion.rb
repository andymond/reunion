require_relative "activity"
require 'pry'

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

  def activity_total_costs
    activities.map do |activity|
      activity.total_cost
    end
  end

  def total_cost
    activity_total_costs.sum
  end

  def split_costs
    activity_total_costs.map.with_index do |total_cost, index|
      total_cost/activities[index].participants.length
    end
  end

  def total_cost_breakdown

  end

end
