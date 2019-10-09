require "../src/*"
require "./spec_helper"

describe Point do
  # TODO: Write tests

  it "creates a point" do
    point = Point.new(1, 2)
    
    point.x.should eq(1)
    point.y.should eq(2)
  end
end