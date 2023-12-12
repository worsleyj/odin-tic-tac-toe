class Game
  def initialize
    @player1 = 'X'
    @player2 = 'O'
    @current = @player1
    @board = Array.new(3) {Array.new(3, '[]') }
  end

  def display_board(board)
    p board[0]
    p board[1]
    p board[2]
    puts "\n"
  end

  def take_turn(board)
    begin
      puts 'Enter x Coordinate (1-3)'
      x_coord = gets.chomp.to_i - 1
      puts 'Enter y Coordinate (1-3)'
      y_coord = gets.chomp.to_i - 1
      if board[x_coord][y_coord] == '[]'
        board[x_coord][y_coord] = @current
      else puts 'Those Coordinates are already taken, try again.'
      end
      next_player(@current)
    rescue StandardError
      puts '** Invalid Coordinates entered, please try again. **' end

    display_board(@board)
  end

  def next_player(current)
    @current = if @current == @player1
                 @player2
               else
                 @player1
               end
  end

  def start_game
    winner = ''
    puts 'The Game Begins!'
    display_board(@board)

    take_turn(@board) # while winner == ''
    take_turn(@board) # while winner == ''
  end
end

game = Game.new
game.start_game
