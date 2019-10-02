require "./spec_helper"
require "../src/*"

describe Orientation do
  it "creates a new orientation with a vector" do
    North.new.forward_vector.should eq({0, 1})
    West.new.forward_vector.should eq({-1, 0})
  end
  
  it "should allow turns" do
    North.new.turn(Right).is_a?(East).should be_true
    South.new.turn(Left).is_a?(East).should be_true
    East.new.turn(Right).is_a?(South).should be_true
    West.new.turn(Left).is_a?(South).should be_true
  end
end
