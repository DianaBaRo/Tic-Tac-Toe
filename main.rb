def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end  

def input_to_index(move)
  index = move.to_i - 1
  index
end

def valid_move?(board, index)
  if (board[index] == " " || board[index] == "" || board[index] == nil) && index.between?(0, 8)
    return true
  else
    return false
  end
end

def move(board, index, value = "X")
  puts board[index] = value
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
  display_board(board)
end

def play(board)
  counter = 0
  while counter < 9
    turn(board)
    counter += 1
  end
end

def turn_count(board)
  move_counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      move_counter += 1
    end
  end
  return move_counter
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end
