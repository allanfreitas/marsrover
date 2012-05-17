#coding: utf-8
require "plateau.rb"

describe Plateau do

  it 'width should returns "5" if I create a "5 5" plateau' do
    plateau_a = Plateau.new("5 5")
    plateau_a.width.should eql(5)
  end

  it 'height should returns "5" if I create a "5 5" plateau' do
    plateau_a = Plateau.new("5 5")
    plateau_a.height.should eql(5)
  end

end
