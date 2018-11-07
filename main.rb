WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Lower row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Rigth column
  [0,4,8], # Left to Rigth diagonal
  [2,4,6] # Rigth to Left diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 =="O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end

  end
else
  false
end

def full?(board)
  !board.any? { |x| x == " " }
end

def draw?(board)
  if !(won?(board)) && full?(board)
    return true
  elsif !(won?(board)) && !(full?(board)) || won?(board)
    return false
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  else 
    return false 
  end 
end  

def winner(board)
  if winning_combination = won?(board)
    board[winning_combination.first]
  end
end
