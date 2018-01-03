require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_activity_has_name
    activity = Activity.new("hiking")

    assert_equal "hiking", activity.name
  end

  def test_activity_begins_with_no_participants
    activity = Activity.new("hiking")

    assert activity.participants.empty?
  end

  def test_participants_can_be_added
    activity = Activity.new("hiking")

    activity.add_participant("Pam", 10.99)

    assert_equal ["Pam"], activity.participants.keys
    assert_equal [10.99], activity.participants.values
  end

  def test_total_cost_of_activity_can_be_calculated
    activity = Activity.new("hiking")

    activity.add_participant("Pam", 1)
    activity.add_participant("Jim", 2)
    activity.add_participant("Michael", 3)
    activity.add_participant("Dwight", 4)

    assert_equal 10, activity.total_cost
  end

  def test_split_cost_splits_total_cost_of_activity
    activity = Activity.new("hiking")

    activity.add_participant("Pam", 1)
    activity.add_participant("Jim", 2)
    activity.add_participant("Michael", 3)
    activity.add_participant("Dwight", 4)

    assert_equal 2.5, activity.split_cost
  end

  def test_amount_owed_returns_amount_owed_by_participant
    activity = Activity.new("hiking")

    activity.add_participant("Pam", 1)
    activity.add_participant("Jim", 2)
    activity.add_participant("Michael", 3)
    activity.add_participant("Dwight", 4)

    assert_equal 1.5, activity.amount_owed("Pam")
    assert_equal 0.5, activity.amount_owed("Jim")
  end

  def test_amount_owed_returns_amount_owed_to_participant
    activity = Activity.new("hiking")

    activity.add_participant("Pam", 1)
    activity.add_participant("Jim", 2)
    activity.add_participant("Michael", 3)
    activity.add_participant("Dwight", 4)

    assert_equal(-0.5, activity.amount_owed("Michael"))
    assert_equal(-1.5, activity.amount_owed("Dwight"))
  end

  def test_amount_owed_returns_squared_up_if_nothing_owed
    activity = Activity.new("hiking")

    activity.add_participant("Pam", 1)
    activity.add_participant("Jim", 1)
    activity.add_participant("Michael", 1)
    activity.add_participant("Dwight", 1)

    assert_equal 0, activity.amount_owed("Pam")
    assert_equal 0, activity.amount_owed("Dwight")
  end

end
