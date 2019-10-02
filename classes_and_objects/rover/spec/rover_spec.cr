require "./spec_helper"
require "../src/*"

describe Rover do

  it "should run a list of commands" do
    expected = Rover.new.move([Forward, Left, Forward, Right])

    expected.orientation.class.should eq(North)
    expected.position.x.should eq(-1)
    expected.position.y.should eq(1)
  end
end
