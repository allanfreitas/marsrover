class Plateau
  attr_accessor :width,:height

  def initialize(plateau_size = "5 5")
    tmp = plateau_size.split
    @width = tmp[0].to_i
    @height = tmp[0].to_i
  end

end