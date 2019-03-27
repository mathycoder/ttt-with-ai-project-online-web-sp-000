require 'pry'

module Players 
  class Computer < Player 
    
    def automove(board)
       ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
    end 
    
    def move(board)
      sample_generator(board)
      best_move = 0 
      best_value = 1 
      @move_array.each_with_index do |value, index| 
        if value > best_value && !(board.taken?(index+1))
          best_move = index + 1 
          best_value = value 
        end 
      end 

      # puts @move_array
      # puts best_move 
      
      @move_array = [0]*9  
      best_move 
    end 
    
    def random_game(board)
      new_cells = []
      new_cells.replace(board.cells)
      board_copy = Board.new(new_cells) 
      auto_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), board_copy)
      auto_game.autoplay
      if auto_game.winner == @token
        update_move_array(board_copy)
      end
    end 
    
    def update_move_array(board_copy)
      board_copy.cells.each_with_index do |cell, index|
        if cell == @token
          @move_array[index] += 1 
        end 
      end 
    end 

    def sample_generator(board)
      100.times do 
        random_game(board)
      end 
      @move_array
    end 
    
    # require_relative './config/environment'
    # p = Players::Computer.new("X")
    # board = Board.new 
    # p.sample_generator(board)
    

      
  end 
end 