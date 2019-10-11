require "rover"
class Store
  def self.rovers()
    @@rovers || (@@rovers = {} of String => Rover)
  end
  
  def self.create(name)
    rovers[name] = Rover.new()
  end
  
  def self.delete(name)
    rovers.delete(name)
  end
  
  def self.get(name)
    rovers[name]
  end
  
  def self.pretty(name)
    rovers[name].status
  end
  
  def self.move(name, move)
    moves = move.split("").map {|m| translate_move(m)}
    rovers[name].move( moves )
    rovers[name].status
  end

  def self.translate_move(move)
    case move
    when "l", "L"
      Left
    when "r", "R"
      Right
    else
      Forward
    end
  end
end

