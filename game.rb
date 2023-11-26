require './player_info'
require './board'
class Game
  def initialize(no_of_player=2)
    @no_of_player=no_of_player
    @player_arr= Array.new(no_of_player)
    @game_over = false
    @board = Board.new
    @is_correct_marker = false
  end

  def set_variable
    for i in 0..(@no_of_player-1)
      @player_arr[i]=PlayerInfo.new
      puts("Please enter the name of player #{i+1}")
      @player_arr[i].set_name=gets.chomp
      puts("#{@player_arr[i].get_name}, please enter the single small letter english character to use it as a marker")
      while !@is_correct_marker
        @player_arr[i].set_marker=gets.chomp
        correct_marker?(@player_arr[i].get_marker)
      end
      @is_correct_marker = false
    end   
  end

  def start_game
    set_variable
    @board.print_board
    while !@game_over
      for player in @player_arr 
        if !@game_over
          puts("#{player.get_name}, Make your move")
          player_move = gets.chomp
          @board.update_arr(player_move.to_i,player.get_marker)
          @board.print_board
          check_game_over(player.get_name)
        end
      end
    end    
  end

  def check_game_over(player_name)
    game_arr=@board.get_game_arr

    if game_arr.values_at(0,1,2).uniq.length==1 || game_arr.values_at(3,4,5).uniq.length==1 || game_arr.values_at(6,7,8).uniq.length==1 || game_arr.values_at(0,3,6).uniq.length==1 || game_arr.values_at(1,4,7).uniq.length==1 || game_arr.values_at(2,5,8).uniq.length==1 || game_arr.values_at(0,4,8).uniq.length==1 || game_arr.values_at(2,4,6).uniq.length==1
      @game_over=true
      puts("#{player_name} won the game")
    elsif !game_arr.any?{|num| num.to_i>0 && num.to_i<10}
      @game_over= true      
      puts("Game TIE") 

    end
  end
  # TODO -  make a array for marker on board that can if the player is not using the same marker
  # TODO - shift function on the board function that checks if the board is full or not
  # TODO - Make seperate function for the win cases, bcs it is repetetive
  # TODO - make the code more readable and menataneable
  def correct_marker?(marker)
    if marker.ord()>96 && marker.ord()<123 && marker.length==1
      @is_correct_marker = true
    elsif 
      puts ("Please enter the character between a-z to use it as a marker")
      @is_correct_marker = false
    end
    if @player_arr.get_marker.at(0,1).uniq.length==1
      if @player_arr[0].get_marker==@player_arr[1].get_marker
        @is_correct_marker=false
        puts ("please don't use same marker as #{@player_arr[0].get_name}")
      else
        @is_correct_marker=true
          
      end
    end
  end
end

game = Game.new
game.set_variable






