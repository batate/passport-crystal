This is a script

```playground
struct Point
  property x, y
  
  def initialize( @x : Int32, @y : Int32)
  end
end

class Board
  property height, width, grid
  
  def initialize(
      height : Int32, 
      width : Int32
    )
    @height = height
    @width = width
    @grid = {} of Point => Symbol
  end
end

board = Board.new(10, 10)
puts board.inspect
puts "#{board.width}, #{board.height}"
```