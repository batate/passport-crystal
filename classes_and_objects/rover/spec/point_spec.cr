require "./spec_helper"
require "../src/*"

describe Point do
  it "creates a new point" do
    Point.new(1, 2).x.should eq(1)
    Point.new(1, 2).y.should eq(2)
  end
  
  it "moves a point" do
    point = Point.new(1, 2).move(3, 4)
    point.x.should eq(4)
    point.y.should eq(6)
  end
end
