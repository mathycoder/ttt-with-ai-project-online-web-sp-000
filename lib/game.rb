class Game 
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]]
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board 
  end 
  
  def current_player 
    board.turn_count % 2 == 0 ? player_1 : player_2
  end 
  
  def won? 
    WIN_COMBINATIONS.find do |combo|
     ( board.position(combo[0]+1) == "X" && board.position(combo[1]+1) == "X" && board.position(combo[2]+1) == "X") || ( board.position(combo[0]+1)== "O" && board.position(combo[1]+1)== "O" && board.position(combo[2]+1) == "O")
    end 
  end 
  
  def draw? 
    !won? && board.full?  
  end 
  
  def over? 
    draw? || won? 
  end 
  
  def winner
    board.position(won?[0]+1) if won?
  end 
  
  def turn(disp=true ) 
    move = current_player.move(board) while !(board.valid_move?(move))
    board.update(move.to_i, current_player)
    board.display if disp
  end 
  
  def autoplay
    while !over?
      autoturn
    end 
  end 
  
  def autoturn
    move = current_player.automove(board) while !(board.valid_move?(move))
    board.update(move.to_i, current_player)
  end 
  
  def play(disp=true) 
    while !over?
      turn(disp) 
    end 
    
    if draw? && disp
      puts "Cat's Game!"
    elsif disp  
      puts "Congratulations #{winner}!"
    end 
  end 
  
end 