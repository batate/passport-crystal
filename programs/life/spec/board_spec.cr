require "../src/*"
require "./spec_helper"

describe Board do
  it "keeps the same generation across next_generation" do
    grid = Grids.stable
    
    board = Board.new(grid)
    next_generation = board.next_generation
    
    next_generation.grid.should eq(board.grid)
  end

  it "generates a different generation before returning to same" do
    grid = Grids.repeater
    
    board = Board.new(grid)
    next_generation = board.next_generation
    next_next_generation = next_generation.next_generation
    
    next_generation.grid.should_not eq(board.grid)
    next_next_generation.grid.should eq(board.grid)
  end

end