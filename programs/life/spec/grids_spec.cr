require "../src/*"
require "./spec_helper"

describe Grids do
  it "creates a repeater" do
    grid = Grids.repeater
    
    grid.class.should eq(String)
  end
end