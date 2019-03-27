class Player 
  attr_reader :token, :move_array 
  
  def initialize(token)
    @token = token 
    @move_array = [0]*9
  end 
end 