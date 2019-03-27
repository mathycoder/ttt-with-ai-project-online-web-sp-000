require 'pry'

class Board
  attr_accessor :cells 
  
  def initialize(cells='none')
    if cells == 'none'
      reset!
    else 
      @cells = cells 
    end 
  end 
  
  def reset!
    @cells = [" "]*9
  end 
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end 
  
  def position(input)
    cells[input.to_i-1]
  end 
  
  def full? 
    cells.all?{|cell| cell == "X" || cell == "O"}
  end 
  
  def turn_count
    count = 0 
    cells.each{|cell| count +=1 if (cell == "X" || cell == "O")}
    count 
  end 
  
  def taken?(pos)
    position(pos) == "X" || position(pos) == "O" 
  end 
  
  def valid_move?(input)
    !(taken?(input)) && input.to_i >=1 && input.to_i <=9 
  end 
  
  def update(input, player)
    cells[input.to_i-1] = player.token 
  end 
end 