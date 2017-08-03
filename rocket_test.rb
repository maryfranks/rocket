require "minitest/autorun"
require_relative "rocket"
require 'pry'

class RocketTest < Minitest::Test
  # Write your tests here!

  def setup
    @rocket = Rocket.new
  end


  def test_name_reader
    # make sure name returns the name of the rocket
    assert @rocket.name
  end

  def test_name_writer
    # make sure that I can change the name of the rocket
    @rocket.name=("Red Rocket")
    assert_equal("Red Rocket", @rocket.name)
  end

  def test_colour_reader
    # make sure that colour returns the name of the color
    assert @rocket.colour
  end

  def test_colour_writer
    # make sure that I can change the color of the rocket
    @rocket.colour=("Grey")
    assert_equal("Grey", @rocket.colour)
  end

  def test_flying_reader
    # make sure that flying? returns true if the rocket is flying
    rocket = Rocket.new(flying: true)
    assert rocket.flying?
  end

  def test_lift_off_already_flying
    # if the rocket is flying @flying remains true
    rocket = Rocket.new(flying: true)
    assert_equal(false, rocket.lift_off)
  end

  def test_lift_off_start_flying
    # if the rocket is not flying make it fly - @flying should return true
    @rocket.lift_off
    assert_equal(true, @rocket.flying?)
  end

  def test_land_not_flying # !!!!!!! make it look like 37
    # if the rocket is flying make it land - @flying should return false
    rocket = Rocket.new(flying: true)
    @rocket.land
    assert_equal(false, @rocket.flying?)
  end

  def test_land_stop_flying
    # if the rocket is not flying @flying remains false
    @rocket.land
    assert_equal(false, @rocket.flying?)
  end

  def test_status_rocket_flying # !!!!!! make fail?
    # rocket is flying and should say it's flying
    @rocket.lift_off
    assert_equal("Rocket #{@rocket.name} is flying through the sky!", @rocket.status)
  end

  def test_status_rocket_not_flying # !!!!!! make fail?
    # rocket is not flying and should say ready for liftoff
    assert_equal("Rocket #{@rocket.name} is ready for lift off!", @rocket.status)
  end

end
