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



end
