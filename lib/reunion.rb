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

  def money_spent
    activities.map do |activity|
      activity.participants.values
    end
  end

  def money_owed
    money_spent.map.with_index do |per_activity, index|
      per_activity.map do |per_person|
        split_costs[index] - per_person
      end
    end
  end

  def money_owed_per_person

  end

  def total_cost_breakdown

  end

end
