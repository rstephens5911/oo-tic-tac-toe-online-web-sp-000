class TicTacToe

   def initialize
     @board = Array.new(9, " ")
   end

   WIN_COMBINATIONS = [
     [0,1,2], # Top row
     [3,4,5], # Middle row
     [6,7,8], # Bottom row
     # --------
     [0,3,6], # Left collumn
     [1,4,7], # Middle collumn
     [2,5,8], # Right collumn
     # -------
     [0,4,8], # L -> R diagonal
     [6,4,2] # R -> L diagonal
   ]

   def display_board
     # build the board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def input_to_index(user_input)
     index = user_input.to_i - 1
   end

   def move(index, token = "X")
     @board[index] = token
   end

   def position_taken?(index)
     if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    if index.to_i >= 1 || index.to_i <= 9 && position_taken?(index)
      false
    else
      true
    end
  end

  def turn
    puts "Choose a position 1-9: "
    user_input = gets.strip
    input_to_index(user_input)
    index = user_input.to_i - 1
    if valid_move?(index)
      current_player
      move(index)
      display_board
    else
      turn
    end

  end

  def turn_count
    count = 0
    @board.each do |element|
      if element == "X" || element == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    token = "X"
    if turn_count % 2 == 0
      token
    else
      token = "O"
    end
    token
  end

end
