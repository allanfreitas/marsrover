#coding: utf-8
require "rover.rb"
require "plateau.rb"

describe Rover do

  before do
    @plateau = Plateau.new("5 5")
  end

  it 'should crashs the rover if walk outside the plateau' do
    rover_a = Rover.new("0 0 N",@plateau)
    rover_a.move("MMMMMM") #it will crashs the rover at North side
    rover_a.crashed.should eql(true)
  end

  it 'should returns "0 5 N" if I try to move to "0 6 N"' do
    rover_a = Rover.new("0 0 N",@plateau)
    rover_a.move("MMMMMM")
    rover_a.where.should eql("0 5 N")
  end

  it 'should returns "1 3 N" if starts at "1 2 N"' do
    rover_a = Rover.new("1 2 N",@plateau)
    rover_a.move("LMLMLMLMM")
    rover_a.where.should eql("1 3 N")
  end

  it 'should returns "W" if starts at "0 0 S" and turn right "R"' do
    rover_a = Rover.new("0 0 S",@plateau)
    rover_a.turn("R")
    rover_a.face.should eql("W")
  end

  it 'should returns "W" if starts at "0 0 N" and turn left "L"' do
    rover_a = Rover.new("0 0 N",@plateau)
    rover_a.turn("L")
    rover_a.face.should eql("W")
  end

  it 'should returns "E" if starts at "0 0 N" and turn right "R"' do
    rover_a = Rover.new("0 0 N",@plateau)
    rover_a.turn("R")
    rover_a.face.should eql("E")
  end

  it 'should returns "E" if starts at "0 0 S" and turn right "L"' do
    rover_a = Rover.new("0 0 S",@plateau)
    rover_a.turn("L")
    rover_a.face.should eql("E")
  end

  it 'should returns "1 0 E" if starts at "0 0 E" and walk' do
    rover_a = Rover.new("0 0 E",@plateau)
    rover_a.walk
    rover_a.where.should eql("1 0 E")
  end

  it 'should returns "5 1 E" if starts at "3 3 E"' do
    rover_a = Rover.new("3 3 E",@plateau)
    rover_a.move("MMRMMRMRRM")
    rover_a.where.should eql("5 1 E")
  end

end
