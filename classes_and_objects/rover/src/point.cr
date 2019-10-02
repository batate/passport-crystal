struct Point
  property x, y

  def initialize(@x : Int32, @y : Int32)
  end
  
  def move(x, y)
    Point.new @x + x, @y + y
  end
end

