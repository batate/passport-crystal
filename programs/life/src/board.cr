class Board
  property(
    height : Int32, 
    width : Int32, 
    grid
  )
  
  def initialize(string : String)
    rows = string.split("\n")
    row_lengths = rows.map {|r| r.size}
    
    @height = rows.size
    @width = row_lengths.max
    
    @grid = {} of Point => Symbol
    
    rows.each.with_index do |row, y|
      cols = row.split("")
      cols.each.with_index do |c, x|
        if c == "x"
          @grid[Point.new(x+1, y+1)] = :live
        end
      end
    end
  end
  
  def neighbor_count(x, y)
    value(at(x-1, y-1)) + 
    value(at(x, y-1)) + 
    value(at(x+1, y-1)) +
    value(at(x-1, y)) + 
    value(at(x+1, y)) + 
    value(at(x-1, y+1)) + 
    value(at(x, y+1)) + 
    value(at(x+1, y+1))
  end
  
  def lonely(x, y)
    neighbor_count(x, y) < 2 
  end
  
  def overcrowded(x, y)
    neighbor_count(x, y) > 3 
  end
  
  def perfect(x, y)
    neighbor_count(x, y) == 3
  end
  
  def next_cell(x, y)
    return :dead if lonely(x, y)
    return :dead if overcrowded(x, y)
    return :live if perfect(x, y)
    return at(x, y)
  end
  
  def at(x  : Int32, y :  Int32)
    grid.fetch(Point.new(x, y),  :dead)
  end
  
  def character(state)
    if state == :live
      "x"
	  else
      " "
	  end
  end

  def next_generation
    rows = (1..height).map do |y|
      row = (1..width).map do |x|
        character(next_cell(x, y))
	    end
      row.join
    end
    
    Board.new(rows.join("\n"))
  end

  def pretty(state)
    if state == :live
      "●"
	  else
      "○"
	  end
  end

  def print
    (1..height).each do |y|
      row = (1..width).map do |x|
        pretty(at(x, y))
	    end
      
      puts row.join
    end
  end

  def value(state)
    if state == :live
      1
		else
      0
    end
  end
end
