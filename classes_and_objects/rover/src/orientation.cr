abstract class Left end
abstract class Right end
abstract class Forward end

alias Direction = (Left.class | Right.class)
alias Command = (Direction | Forward.class)

abstract class Orientation end

macro define_orientation(name, **args)
  class {{name}} < Orientation
    def forward_vector : Tuple(Int32, Int32)
      { {{args[:x]}}, {{args[:y]}} }
    end
    def turn(direction : Direction) : Orientation
      if direction == Left  
        {{args[:left]}}.new 
      else # direction can ONLY be right
        {{args[:right]}}.new
      end
    end
  end  
end

define_orientation(North, x: 0,  y: 1,  left: West,  right: East)
define_orientation(South, x: 0,  y: -1, left: East,  right: West)
define_orientation(East,  x: 1,  y: 0,  left: North, right: South)
define_orientation(West,  x: -1, y: 0,  left: South, right: North)
