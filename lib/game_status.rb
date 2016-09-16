# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant


WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # diagonal one
  [6,4,2]  # diagonal two
]


def won?(b)
  WIN_COMBINATIONS.detect do |i|
    b[i[0]] == b[i[1]] &&
    b[i[1]] == b[i[2]] &&
    position_taken?(b,i[0])
  end
end

def full?(b)
  b.all? { |i| i == "X" || i == "O"  }
end

def draw?(b)
  !won?(b) && full?(b)
end

def over?(b)
  won?(b) || full?(b) || draw?(b)
end

def winner(b)
  if winning_combo = won?(b)
    b[winning_combo.first]
  end
end
