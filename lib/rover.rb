class Rover

  attr_accessor :face,:x,:y,:crashed

  def initialize(position = "0 0 N",plateau)
    @plateau_width = plateau.width
    @plateau_height = plateau.height
    @rosewind = ["N","E","S","W"] # using odds indexes to indetify X axis
    tmp = position.split
    @x = tmp[0].to_i
    @y = tmp[1].to_i
    @face = tmp[2]
    @crash = false
  end
  
  def validate(command)
    self.turn(command) if command=="L" or command=="R" 
    self.walk if command=="M"
  end
  
  def turn(side)
    offset =  1 if side=="R"
    offset =  -1 if side=="L"
    new_face_index = @rosewind.index(@face)+offset
    new_face_index = 0 if new_face_index == 4 # restarts the pointer
    @face = @rosewind[new_face_index]
  end
  
  def walk
    if (@rosewind.index(@face) % 2)==0 # Y axis
      @y += (@rosewind.index(@face)-1)*(-1) # using rosewind array index to identify North or South
  
      @crashed = (@y > @plateau_width or @y < 0) # detect crash of rover
  
      # stops the rover
      @y = @plateau_height if @y > @plateau_height # stops the rover
      @y = 0 if @y < 0
  
    else # X axis
      @x += (@rosewind.index(@face)-2)*(-1) # using rosewind array index to identify East or West
  
      @crash = (@x > @plateau_width or @x < 0) # detect crash of rover
  
      # stops the rover
      @x = @plateau_width if @x > @plateau_width 
      @x = 0 if @x < 0
    end
  end
  
  def move(new_position = "")
    new_position.length.times{ |x|   self.validate(new_position[x]) }
  end
  
  def where
    @x.to_s+" "+@y.to_s+" "+@face
  end

end
