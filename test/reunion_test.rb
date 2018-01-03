require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def test_reunion_has_location
    reunion = Reunion.new("Tallahassee")

    assert_equal "Tallahassee", reunion.location
  end

  def test_reunion_initializes_with_no_activities
    reunion = Reunion.new("Tallahassee")

    assert_equal [], reunion.activities
  end

  def test_activities_can_be_added_to_reunion
    reunion = Reunion.new("Tallahassee")

    reunion.add_activity("hiking")
    first_activity = reunion.activities[0]

    assert_instance_of Activity, first_activity
    assert_equal "hiking", first_activity.name
  end

  def test_total_cost_of_reunion_can_be_calculated
    reunion = Reunion.new("Tallahassee")

    reunion.add_activity("hiking")
    first_activity = reunion.activities[0]
    first_activity.add_participant("Andy", 1)
    first_activity.add_participant("Michael", 1)
    first_activity.add_participant("Dwight", 1)

    assert_equal 3, reunion.total_cost

    reunion.add_activity("boatin'")
    second_activity = reunion.activities[1]
    second_activity.add_participant("Andy", 2)
    second_activity.add_participant("Michael", 3)
    second_activity.add_participant("Dwight", 4)

    assert_equal 12, reunion.total_cost
  end

  def test_split_costs_returns_array_of_split_costs
    reunion = Reunion.new("Tallahassee")

    reunion.add_activity("hiking")
    first_activity = reunion.activities[0]
    first_activity.add_participant("Andy", 1)
    first_activity.add_participant("Michael", 1)
    first_activity.add_participant("Dwight", 1)

    reunion.add_activity("boatin'")
    second_activity = reunion.activities[1]
    second_activity.add_participant("Andy", 2)
    second_activity.add_participant("Michael", 3)
    second_activity.add_participant("Dwight", 4)

    assert_equal [1, 3], reunion.split_costs
  end

  def test_money_spent_returns_array_of_arrays_of_money_spent
    reunion = Reunion.new("Tallahassee")

    reunion.add_activity("hiking")
    first_activity = reunion.activities[0]
    first_activity.add_participant("Andy", 1)
    first_activity.add_participant("Michael", 1)
    first_activity.add_participant("Dwight", 1)

    reunion.add_activity("boatin'")
    second_activity = reunion.activities[1]
    second_activity.add_participant("Andy", 2)
    second_activity.add_participant("Michael", 3)
    second_activity.add_participant("Dwight", 4)

    assert_equal [[1, 1, 1], [2, 3, 4]], reunion.money_spent
  end

  def test_total_cost_breakdown_of_union_can_be_calculated
    skip
    reunion = Reunion.new("Tallahassee")

    reunion.add_activity("hiking")
    first_activity = reunion.activities[0]
    first_activity.add_participant("Andy", 1)
    first_activity.add_participant("Michael", 1)
    first_activity.add_participant("Dwight", 1)

    reunion.add_activity("boatin'")
    second_activity = reunion.activities[1]
    second_activity.add_participant("Andy", 2)
    second_activity.add_participant("Michael", 3)
    second_activity.add_participant("Dwight", 4)

    breakdown = {"Andy" => 1, "Michael" => 0, "Dwight" => -1}

    assert_equal breakdown, reunion.total_cost_breakdown
  end

end
