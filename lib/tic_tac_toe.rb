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
     (@board[index] == " " || @board[index] == "" ) ? false : true
   end

  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Choose a position 1-9: "
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
    display_board
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
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |element|
      pos1 = @board[element[0]]
      pos2 = @board[element[1]]
      pos3 = @board[element[2]]
      if (pos1 == "X" && pos2 == "X" && pos3 == "X" || pos1 == "O" && pos2 == "O" && pos3 == "O")
        return element
      end
    end
    return false
  end

  def full?
    @board.include?(" " || "") ? false : true
  end

  def draw?
    if full? && !won?
      true
    elsif won? || !won? || !full?
      false
    end
  end

  def over?
    won? || full?
  end

  def winner
    if won?
      (@board[won?[0]] == "X") ? "X" : "O"
    else
      nil
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
