class Board
  def initialize
    @game_arr=[1,2,3,4,5,6,7,8,9]
  end
  def print_board
    for i in 0..2
      puts (" #{@game_arr[2*i+i]} | #{@game_arr[2*i+i+1]} | #{@game_arr[2*i+i+2]}")
      if i!=2
        puts ("---+---+---")        
      end
    end
  end
  def update_arr(pos,marker)
    @game_arr[pos-1]=marker
  end
  def get_game_arr
    @game_arr
  end
end

board = Board.new
board.print_board
board.update_arr(2,"x")
board.print_board