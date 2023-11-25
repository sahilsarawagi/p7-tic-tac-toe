require './player_info'
require './board'
class Game
  def initialize(no_of_player)
    @no_of_player=no_of_player
    @player_arr= Array.new(no_of_player)
    @player_arr[0]=PlayerInfo.new
    @player_arr[1]=PlayerInfo.new
    @game_over = false
    @board = Board.new
  end
  def set_variable
    for i in 0..1
      puts("Please enter the name of player #{i+1}")
      @player_arr[i].set_name=gets.chomp
      puts("#{@player_arr[i].get_name} enter the marker that you want to use")
      @player_arr[i].set_marker=gets.chomp
    end   
  end
  def start_game
    set_variable
    @board.print_board
    while !@game_over
      for player in @player_arr
        puts("#{player.get_name}, Make your move")
        player_move = gets.chomp
        @board.update_arr(player_move.to_i,player.get_marker)
        @board.print_board
      end
      
    end
    
  end
  def check_game_over
    @game_over= true
  end
end
game = Game.new(2)
game.start_game






