class Game
  def initialize
    @player1 = 'X'
    @player2 = 'O'
    @current = @player1
    @winner = '[]'
    @board = Array.new(3) {Array.new(3, '[]') }
  end

  def display_board(board)
    p board[0]
    p board[1]
    p board[2]
    puts "\n"
  end

  def take_turn(board)
    make_move(@board)
    check_winner()
    # next_player(@current)
    display_board(@board)
  end

  def make_move(board)
    begin
      puts 'Enter x Coordinate (1-3)'
      x_coord = gets.chomp.to_i - 1
      puts 'Enter y Coordinate (1-3)'
      y_coord = gets.chomp.to_i - 1

      if board[x_coord][y_coord] != '[]'
        puts 'Those Coordinates are already taken, try again.'
        display_board(@board)
        make_move(@board)
      else
        board[x_coord][y_coord] = @current end
    rescue
        puts 'Those Coordinates are invalid, try again.'
    end
  end

  def next_player(current)
    @current = if @current == @player1
                 @player2
               else
                 @player1
               end
    puts "---------------------------------"
    puts @current + " is making their move."
  end

  def check_winner()
    check_rows(@board)
    check_columns(@board)
    check_diagonals(@board)
  end

  def check_rows(board)
    @winner = board[0][0] if board[0][0] == board[0][1] && board[0][1] == board[0][2]
    @winner = board[1][0] if board[1][0] == board[1][1] && board[1][1] == board[1][2]
    @winner = board[2][0] if board[2][0] == board[2][1] && board[2][1] == board[2][2]
  end

  def check_columns(board)
    @winner = board[0][0] if board[0][0] == board[1][0] && board[1][0] == board[2][0]
    @winner = board[0][1] if board[0][1] == board[1][1] && board[1][1] == board[2][1]
    @winner = board[0][2] if board[0][2] == board[1][2] && board[1][2] == board[2][2]
  end

  def check_diagonals(board)
    @winner = board[0][0] if board[0][0] == board[1][1] && board[1][1] == board[2][2]
    @winner = board[2][0] if board[2][0] == board[1][1] && board[1][1] == board[0][2]
  end

  def start_game
    puts 'The Game Begins!'
    display_board(@board)

    take_turn(@board) while @winner == '[]'
    puts "The winner is: " + @winner
  end
end

game = Game.new
game.start_game
